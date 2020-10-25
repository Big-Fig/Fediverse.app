import 'package:easy_localization/easy_localization.dart';
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
        contentText: tr("app.account.action.report.success.toast"),
        titleText: null);
  } else {
    await FediSimpleAlertDialog(
      context: context,
      title: tr("app.account.action.report.fail.dialog.title"),
      contentText: tr("app.account.action.report.fail.dialog.content"),
    ).show(context);
  }
  return success;
}
