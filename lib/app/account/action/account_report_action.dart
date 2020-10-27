import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/async/pleroma_async_operation_helper.dart';
import 'package:fedi/app/ui/dialog/alert/fedi_simple_alert_dialog.dart';
import 'package:fedi/app/ui/notification_overlay/info_fedi_notification_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> doAsyncActionReport(
    BuildContext context, IAccountBloc accountBloc) async {
  var dialogResult =
      await PleromaAsyncOperationHelper.performPleromaAsyncOperation(
          context: context, asyncCode: () => accountBloc.report());

  var success = dialogResult.success;
  if (success) {
    showInfoFediNotificationOverlay(
        context: context,
        contentText: S.of(context).app_account_action_report_success_toast,
        titleText: null);
  } else {
    await FediSimpleAlertDialog(
      context: context,
      title:S.of(context).app_account_action_report_fail_dialog_title,
      contentText:S.of(context).app_account_action_report_fail_dialog_content,
    ).show(context);
  }
  return success;
}
