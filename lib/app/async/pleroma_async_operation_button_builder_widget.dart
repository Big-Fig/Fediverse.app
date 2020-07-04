import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_exception.dart';
import 'package:flutter/widgets.dart';

class PleromaAsyncOperationButtonBuilderWidget
    extends AsyncOperationButtonBuilderWidget {
  static final List<ErrorDataBuilder> pleromaErrorDataBuilders = [
    pleromaThrottledErrorAlertDialogBuilder,
    pleromaErrorAlertDialogBuilder,
    socketErrorAlertDialogBuilder,
  ];

  PleromaAsyncOperationButtonBuilderWidget({
    @required ButtonBuilder builder,
    @required AsyncButtonAction asyncButtonAction,
    String progressContentMessage,
    String successToastMessage,
    bool showProgressDialog = true,
    List<ErrorDataBuilder> errorAlertDialogBuilders = const [],
  }) : super(
            builder: builder,
            asyncButtonAction: asyncButtonAction,
            showProgressDialog: showProgressDialog,
            progressContentMessage: progressContentMessage,
            successToastMessage: successToastMessage,
            errorDataBuilders: [
              // top priority for passed to constructor handlers
              ...(errorAlertDialogBuilders ?? []),
              // low priority for base Pleroma handler
              ...pleromaErrorDataBuilders
            ]);

  static ErrorData pleromaThrottledErrorAlertDialogBuilder(
    BuildContext context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is PleromaThrottledRestException) {
      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleText: tr("app.async.pleroma.error.throttled.dialog.title"),
        contentText: tr("app.async.pleroma.error.throttled.dialog.content"),
      );
    } else {
      return null;
    }
  }

  static ErrorData pleromaErrorAlertDialogBuilder(
    BuildContext context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is PleromaRestException) {
      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleText: tr("app.async.pleroma.error.common.dialog.title"),
        contentText: tr("app.async.pleroma.error.common.dialog.content",
            args: [error.toString()]),
      );
    } else {
      return null;
    }
  }

  static ErrorData socketErrorAlertDialogBuilder(
    BuildContext context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is SocketException) {
      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleText: tr("app.async.socket.error.dialog.title"),
        contentText: tr("app.async.socket.error.dialog.content"),
      );
    } else {
      return null;
    }
  }
}
