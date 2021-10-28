import 'dart:io';

import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/chat/conversation/share/conversation_chat_share_entity_page.dart';
import 'package:fedi_app/app/chat/unifedi/share/unifedi_chat_share_entity_page.dart';
import 'package:fedi_app/app/html/html_text_helper.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/share/entity/share_entity_model.dart';
import 'package:fedi_app/app/share/income/action/income_share_action_model.dart';
import 'package:fedi_app/app/share/income/handler/income_share_handler_bloc.dart';
import 'package:fedi_app/app/status/post/new/new_post_status_page.dart';
import 'package:fedi_app/app/status/post/post_status_model.dart';
import 'package:fedi_app/app/toast/toast_service.dart';
import 'package:fedi_app/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi_app/app/ui/fedi_icons.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/share/income/income_share_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('income_share_action_chooser_dialog.dart');

Future<void> showIncomeShareActionChooserDialog(
  BuildContext context, {
  required IIncomeShareHandlerBloc incomeShareHandlerBloc,
  required IncomeShareEvent incomeShareEvent,
}) async {
  _logger.finest(() => 'showIncomeShareInstanceChooserDialog');

  var types = IncomeShareActionType.values;

  var unifediApiChatService = Provider.of<IUnifediApiChatService>(
    context,
    listen: false,
  );

  var isChatSupported = unifediApiChatService.isFeatureSupported(
    unifediApiChatService.getChatsFeature,
  );

  if (!isChatSupported) {
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
    actions: types
        .map(
          (type) => _createAction(
            context: context,
            type: type,
          ),
        )
        .toList(),
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
  switch (incomeShareActionType) {
    case IncomeShareActionType.status:
      var incomeShareEventMedias = incomeShareEvent.medias;
      var mediaAttachments = await _uploadMediaIfNeed(
        context: context,
        incomeShareEventMedias: incomeShareEventMedias,
      );
      var dontHaveErrorsDuringMediaUploading =
          mediaAttachments?.length == incomeShareEventMedias?.length;

      if (dontHaveErrorsDuringMediaUploading) {
        goToNewPostStatusPage(
          context,
          initialData: PostStatusData.only(
            text: incomeShareEvent.text,
            mediaAttachments: mediaAttachments,
          ),
        );
      }

      break;
    case IncomeShareActionType.conversation:
      goToConversationChatShareEntityPage(
        context: context,
        shareEntity: ShareEntity(
          items: [
            _mapIncomeShareEventToShareEntity(
              incomeShareEvent,
            ),
          ],
        ),
        instanceLocation: InstanceLocation.local,
      );
      break;
    case IncomeShareActionType.chat:
      goToUnifediChatShareEntityPage(
        context: context,
        shareEntity: ShareEntity(
          items: [
            _mapIncomeShareEventToShareEntity(
              incomeShareEvent,
            ),
          ],
        ),
        instanceLocation: InstanceLocation.local,
      );
      break;
  }
}

ShareEntityItem _mapIncomeShareEventToShareEntity(
  IncomeShareEvent incomeShareEvent,
) =>
    ShareEntityItem(
      createdAt: null,
      fromAccount: null,
      text: incomeShareEvent.text?.extractRawStringFromHtmlString(),
      linkToOriginal: null,
      mediaAttachments: null,
      mediaLocalFiles: incomeShareEvent.medias
          ?.map(
            (incomeShareEventMedia) => ShareEntityItemLocalMediaFile(
              file: File(
                incomeShareEventMedia.path,
              ),
              isNeedDeleteAfterUsage: true,
            ),
          )
          .toList(),
      isNeedReUploadMediaAttachments: false,
    );

Future<List<IUnifediApiMediaAttachment>?> _uploadMediaIfNeed({
  required BuildContext context,
  required List<IncomeShareEventMedia>? incomeShareEventMedias,
}) async {
  List<IUnifediApiMediaAttachment>? mediaAttachments;
  if (incomeShareEventMedias?.isNotEmpty == true) {
    var dialogResult = await UnifediAsyncOperationHelper
        .performUnifediAsyncOperation<List<IUnifediApiMediaAttachment>>(
      context: context,
      contentMessage: S.of(context).app_media_upload_progress,
      asyncCode: () async {
        var unifediApiMediaAttachmentService =
            Provider.of<IUnifediApiMediaAttachmentService>(
          context,
          listen: false,
        );

        var futures = incomeShareEventMedias!.map(
          (incomeShareEventMedia) async {
            var file = File(incomeShareEventMedia.path);
            var unifediApiMediaAttachment =
                await unifediApiMediaAttachmentService.uploadMedia(
              file: file,
              thumbnail: null,
              description: null,
              focus: null,
              processInBackground: null,
            );

            // shared filed was copied to temp folder
            // ignore: avoid-ignoring-return-values
            await file.delete();

            return unifediApiMediaAttachment;
          },
        );

        var unifediApiMediaAttachments = await Future.wait(futures);

        return unifediApiMediaAttachments;
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
