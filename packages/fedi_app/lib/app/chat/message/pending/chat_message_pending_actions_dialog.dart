import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_helper.dart';
import 'package:fedi_app/app/chat/message/chat_message_bloc.dart';
import 'package:fedi_app/app/ui/dialog/actions/fedi_actions_dialog.dart';
import 'package:fedi_app/dialog/dialog_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/ui/theme/ui_theme_model.dart';
import 'package:flutter/widgets.dart';

Future<void> showChatMessagePendingActionsDialog({
  required BuildContext context,
  required IChatMessageBloc chatMessageBloc,
}) =>
    FediActionsDialog(
      title: S.of(context).app_chat_message_pending_actions_dialog_title,
      actions: [
        DialogAction(
          label: S
              .of(context)
              .app_chat_message_pending_actions_dialog_action_resend,
          onAction: (BuildContext context) async {
            var dialogResult = await UnifediAsyncOperationHelper
                .performUnifediAsyncOperation<void>(
              context: context,
              asyncCode: () => chatMessageBloc.resendPendingFailed(),
            );

            if (dialogResult.success) {
              Navigator.of(context).pop();
            }
          },
        ),
        DialogAction(
          label: S
              .of(context)
              .app_chat_message_pending_actions_dialog_action_delete,
          customColor: IUiColorTheme.of(context, listen: false).error,
          onAction: (BuildContext context) async {
            var dialogResult = await UnifediAsyncOperationHelper
                .performUnifediAsyncOperation<void>(
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
