import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> doAsyncActionReport(
    BuildContext context, IAccountBloc accountBloc) async {
  var dialogResult = await doAsyncOperationWithDialog(
      context: context, asyncCode: () => accountBloc.report());

  var success = dialogResult.success;
  if (success) {
    await Fluttertoast.showToast(
        msg: tr("app.account.action.report.success.toast"),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  } else {
    await SimpleAlertDialog(
      context: context,
      title: tr("app.account.action.report.fail.dialog.title"),
      content: tr("app.account.action.report.fail.dialog.content"),
    ).show(context);
  }
  return success;
}
