import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_exception.dart';
import 'package:fedi/refactored/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/refactored/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/refactored/dialog/async/async_dialog.dart';
import 'package:fedi/refactored/dialog/base_dialog.dart';
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
              pleromaErrorAlertDialogBuilder,
              socketErrorAlertDialogBuilder,
            ]);

  static BaseDialog pleromaErrorAlertDialogBuilder(
      BuildContext context, dynamic error) {
    if (error is PleromaRestException) {
      return SimpleAlertDialog(
        context: context,
        title: AppLocalizations.of(context)
            .tr("app.async.pleroma.error.dialog.title"),
        content: AppLocalizations.of(context).tr(
            "app.async.pleroma.error.dialog.content",
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
        title: AppLocalizations.of(context)
            .tr("app.async.socket.error.dialog.title"),
        content: AppLocalizations.of(context).tr(
            "app.async.socket.error.dialog.content",
            args: [error.toString()]),
      );
    } else {
      return null;
    }
  }
}
