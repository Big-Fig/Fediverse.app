import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/share/income/action/income_share_action_model.dart';
import 'package:fedi/app/share/income/handler/income_share_handler_bloc.dart';
import 'package:fedi/app/status/post/new/new_post_status_page.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/ui/dialog/chooser/fedi_chooser_dialog.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
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
    switch (incomeShareActionType) {
      case IncomeShareActionType.status:
        goToNewPostStatusPage(
          context,
          initialData: PostStatusData.only(
            visibilityString: PleromaApiVisibility.public.toJsonValue(),
            isNsfwSensitiveEnabled: false,
          ),
        );
        break;
      case IncomeShareActionType.conversation:
        goToNewPostStatusPage(
          context,
          initialData: PostStatusData.only(
            visibilityString: PleromaApiVisibility.public.toJsonValue(),
            isNsfwSensitiveEnabled: false,
          ),
        );
        break;
      case IncomeShareActionType.chat:
        goToNewPostStatusPage(
          context,
          initialData: PostStatusData.only(
            visibilityString: PleromaApiVisibility.public.toJsonValue(),
            isNsfwSensitiveEnabled: false,
          ),
        );
        break;
    }
  } else {
    await incomeShareHandlerBloc.reset();
  }
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
