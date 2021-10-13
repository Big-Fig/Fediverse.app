import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:fedi/app/ui/dialog/actions/fedi_actions_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/theme/ui_theme_model.dart';
import 'package:flutter/widgets.dart';

Future showChatMessagePendingActionsDialog({
  required BuildContext context,
  required IChatMessageBloc chatMessageBloc,
}) {
  return FediActionsDialog(
    title: S.of(context).app_chat_message_pending_actions_dialog_title,
    actions: [
      DialogAction(
        label:
            S.of(context).app_chat_message_pending_actions_dialog_action_resend,
        onAction: (BuildContext context) async {
          var dialogResult = await PleromaAsyncOperationHelper
              .performPleromaAsyncOperation<void>(
            context: context,
            asyncCode: () => chatMessageBloc.resendPendingFailed(),
          );

          if (dialogResult.success) {
            Navigator.of(context).pop();
          }
        },
      ),
      DialogAction(
        label:
            S.of(context).app_chat_message_pending_actions_dialog_action_delete,
        customColor: IUiColorTheme.of(context, listen: false).error,
        onAction: (BuildContext context) async {
          var dialogResult = await PleromaAsyncOperationHelper
              .performPleromaAsyncOperation<void>(
            context: context,
            asyncCode: () => chatMessageBloc.delete(),
          );

          if (dialogResult.success) {
            Navigator.of(context).pop();
          }
        },
      ),
    ],
  ).show<void>(context);
}
