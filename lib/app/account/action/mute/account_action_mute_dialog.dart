import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_base_alert_dialog.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

void showAccountActionMuteDialog(
    BuildContext context, IAccountBloc accountBloc) {
  FediBaseAlertDialog(
    actionsBorderVisible: false,
    title: S.of(context).app_account_mute_dialog_title,
    contentText: S.of(context).app_account_mute_dialog_content,
    actionsAxis: Axis.vertical,
    cancelable: true,
    actions: [
      DialogAction(
        label: S
            .of(context)
            .app_account_mute_dialog_action_mute_with_notifications,
        onAction: (context) async {
          await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            asyncCode: () async {
              await accountBloc.mute(notifications: true);
            },
          );

          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
      DialogAction(
        label: S
            .of(context)
            .app_account_mute_dialog_action_mute_without_notifications,
        onAction: (context) async {
          await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
            context: context,
            asyncCode: () async {
              await accountBloc.mute(notifications: false);
            },
          );

          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    ],
  ).show(context);
}
