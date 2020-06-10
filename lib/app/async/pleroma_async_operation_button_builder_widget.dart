import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_exception.dart';
import 'package:flutter/widgets.dart';

class PleromaAsyncOperationButtonBuilderWidget
    extends AsyncOperationButtonBuilderWidget {
  PleromaAsyncOperationButtonBuilderWidget({
    @required ButtonBuilder builder,
    @required AsyncButtonAction asyncButtonAction,
    String progressContentMessage,
    bool showProgressDialog = true,
    List<ErrorAlertDialogBuilder> errorAlertDialogBuilders = const [],
  }) : super(
            builder: builder,
            asyncButtonAction: asyncButtonAction,
            showProgressDialog: showProgressDialog,
            progressContentMessage: progressContentMessage,
            errorAlertDialogBuilders: [
              // top priority for passed to constructor handlers
              ...(errorAlertDialogBuilders ?? []),
              // low priority for base Pleroma handler
              pleromaThrottledErrorAlertDialogBuilder,
              pleromaErrorAlertDialogBuilder,
              socketErrorAlertDialogBuilder,
            ]);

  static BaseDialog pleromaThrottledErrorAlertDialogBuilder(
      BuildContext context, dynamic error) {
    if (error is PleromaThrottledRestException) {
      return SimpleAlertDialog(
        context: context,
        title: tr("app.async.pleroma.error.throttled.dialog.title"),
        content: tr("app.async.pleroma.error.throttled.dialog.content"),
      );
    } else {
      return null;
    }
  }

  static BaseDialog pleromaErrorAlertDialogBuilder(
      BuildContext context, dynamic error) {
    if (error is PleromaRestException) {
      return SimpleAlertDialog(
        context: context,
        title: tr("app.async.pleroma.error.common.dialog.title"),
        content: tr("app.async.pleroma.error.common.dialog.content",
            args: [error.toString()]),
      );
    } else {
      return null;
    }
  }

  static BaseDialog socketErrorAlertDialogBuilder(
      BuildContext context, dynamic error) {
    if (error is SocketException) {
      return SimpleAlertDialog(
        context: context,
        title: tr("app.async.socket.error.dialog.title"),
        content: tr("app.async.socket.error.dialog.content",
            args: [error.toString()]),
      );
    } else {
      return null;
    }
  }
}
