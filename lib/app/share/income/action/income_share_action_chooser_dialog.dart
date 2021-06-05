import 'dart:io';

import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/chat/conversation/share/conversation_chat_share_status_page.dart';
import 'package:fedi/app/chat/pleroma/share/pleroma_chat_share_status_page.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/share/income/action/income_share_action_model.dart';
import 'package:fedi/app/share/income/handler/income_share_handler_bloc.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/api/id/pleroma_api_fake_id_helper.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:fedi/share/income/income_share_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

final _logger = Logger('income_share_action_chooser_dialog.dart');

Future showIncomeShareActionChooserDialog(
  BuildContext context, {
  required IIncomeShareHandlerBloc incomeShareHandlerBloc,
  required IncomeShareEvent incomeShareEvent,
}) async {
  _logger.finest(() => 'showIncomeShareInstanceChooserDialog');

  var currentAuthInstanceBloc =
      ICurrentAuthInstanceBloc.of(context, listen: false);
  var types = IncomeShareActionType.values;

  var isPleroma = currentAuthInstanceBloc.currentInstance!.isPleroma;

  if (!isPleroma) {
    types = types
        .where(
          (item) => item != IncomeShareActionType.chat,
        )
        .toList();
  }
  var incomeShareActionType =
      await showFediChooserDialog<IncomeShareActionType>(
    context: context,
    title: S.of(context).app_share_income_action_choose_title,
    actions: types.map(
      (type) {
        return _createAction(
          context: context,
          type: type,
        );
      },
    ).toList(),
  );

  if (incomeShareActionType != null) {
    await _performIncomeShareAction(
      context: context,
      incomeShareEvent: incomeShareEvent,
      incomeShareActionType: incomeShareActionType,
    );
  } else {
    await incomeShareHandlerBloc.reset();
  }
}

Future<void> _performIncomeShareAction({
  required BuildContext context,
  required IncomeShareEvent incomeShareEvent,
  required IncomeShareActionType incomeShareActionType,
}) async {
  var incomeShareEventMedias = incomeShareEvent.medias;
  var mediaAttachments = await _uploadMediaIfNeed(
    context: context,
    incomeShareEventMedias: incomeShareEventMedias,
  );
  var dontHaveErrorsDuringMediaUploading =
      mediaAttachments?.length == incomeShareEventMedias?.length;

  if (dontHaveErrorsDuringMediaUploading) {
    switch (incomeShareActionType) {
      case IncomeShareActionType.status:
        goToNewPostStatusPage(
          context,
          initialData: PostStatusData.only(
            text: incomeShareEvent.text,
            mediaAttachments: mediaAttachments,
          ),
        );

        break;
      case IncomeShareActionType.conversation:
        goToConversationShareStatusPage(
          context: context,
          status: _createFakeStatusBaseOnIncomeShareEvent(
            incomeShareEvent: incomeShareEvent,
            mediaAttachments: mediaAttachments,
            context: context,
          ),
          instanceLocation: InstanceLocation.local,
        );
        break;
      case IncomeShareActionType.chat:
        goToPleromaChatShareStatusPage(
          context: context,
          status: _createFakeStatusBaseOnIncomeShareEvent(
            incomeShareEvent: incomeShareEvent,
            mediaAttachments: mediaAttachments,
            context: context,
          ),
          instanceLocation: InstanceLocation.local,
        );
        break;
    }
  }
}

DbStatusPopulatedWrapper _createFakeStatusBaseOnIncomeShareEvent({
  required BuildContext context,
  required IncomeShareEvent incomeShareEvent,
  required List<IPleromaApiMediaAttachment>? mediaAttachments,
}) {
  var myAccountBloc = IMyAccountBloc.of(context, listen: false);
  // todo: rework
  var pleromaApiFakeId = generateUniquePleromaApiFakeId();

  return PleromaApiStatus.only(
    content: incomeShareEvent.text,
    mediaAttachments: mediaAttachments?.toPleromaApiMediaAttachments(),
    id: pleromaApiFakeId,
    createdAt: DateTime.now(),
    sensitive: false,
    // ignore: no-equal-arguments
    uri: pleromaApiFakeId,
    account: myAccountBloc.account.toPleromaApiAccount(),
    visibility: PleromaApiVisibility.public.toJsonValue(),
  ).toDbStatusPopulatedWrapper();
}

Future<List<IPleromaApiMediaAttachment>?> _uploadMediaIfNeed({
  required BuildContext context,
  required List<IncomeShareEventMedia>? incomeShareEventMedias,
}) async {
  List<IPleromaApiMediaAttachment>? mediaAttachments;
  if (incomeShareEventMedias?.isNotEmpty == true) {
    var dialogResult = await PleromaAsyncOperationHelper
        .performPleromaAsyncOperation<List<IPleromaApiMediaAttachment>>(
      context: context,
      contentMessage: S.of(context).app_media_upload_progress,
      asyncCode: () async {
        var pleromaApiMediaAttachmentService =
            IPleromaApiMediaAttachmentService.of(context, listen: false);

        var futures = incomeShareEventMedias!.map(
          (incomeShareEventMedia) async {
            var file = File(incomeShareEventMedia.path);
            var pleromaApiMediaAttachment =
                await pleromaApiMediaAttachmentService.uploadMedia(
              file: file,
            );

            // shared filed was copied to temp folder
            await file.delete();

            return pleromaApiMediaAttachment;
          },
        );

        var pleromaApiMediaAttachments = await Future.wait(futures);

        return pleromaApiMediaAttachments;
      },
    );

    var result = dialogResult.result;

    if (result != null) {
      mediaAttachments = result;
    } else {
      IToastService.of(context, listen: false).showErrorToast(
        context: context,
        title: S.of(context).app_media_upload_failed_notification_title,
        content: dialogResult.handledError.toString(),
      );
    }
  }

  return mediaAttachments;
}

DialogAction _createAction({
  required BuildContext context,
  required IncomeShareActionType type,
}) {
  DialogAction action;
  switch (type) {
    case IncomeShareActionType.status:
      action = DialogAction(
        icon: FediIcons.send,
        label: S.of(context).app_share_income_action_type_status,
        onAction: (context) {
          Navigator.of(context).pop(type);
        },
      );
      break;
    case IncomeShareActionType.conversation:
      action = DialogAction(
        icon: FediIcons.envelope,
        label: S.of(context).app_share_income_action_type_conversation,
        onAction: (context) {
          Navigator.of(context).pop(type);
        },
      );
      break;
    case IncomeShareActionType.chat:
      action = DialogAction(
        icon: FediIcons.chat,
        label: S.of(context).app_share_income_action_type_chat,
        onAction: (context) {
          Navigator.of(context).pop(type);
        },
      );
      break;
  }

  return action;
}
