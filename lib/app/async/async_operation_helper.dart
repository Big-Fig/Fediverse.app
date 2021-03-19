import 'dart:async';
import 'dart:io';

import 'package:fedi/app/async/async_operation_button_builder_widget.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class AsyncOperationHelper {
  static const List<ErrorDataBuilder> defaultErrorDataBuilders = [
    socketErrorAlertDialogBuilder,
    timeoutErrorAlertDialogBuilder,
  ];

  static Future<AsyncDialogResult<T?>> performAsyncOperation<T>({
    required BuildContext context,
    required AsyncButtonAction<T> asyncCode,
    String? contentMessage,
    List<ErrorDataBuilder> errorDataBuilders = defaultErrorDataBuilders,
    bool createDefaultErrorDataUnhandledError = true,
    bool showNotificationOnError = true,
    bool showProgressDialog = true,
    ErrorCallback? errorCallback,
    bool cancelable = false,
  }) =>
      doAsyncOperationWithDialog(
        context: context,
        asyncCode: asyncCode,
        errorCallback: (context, errorData) {
          if (errorCallback != null) {
            errorCallback(context, errorData);
          }
          if (showNotificationOnError) {
            IToastService.of(context!, listen: false).showErrorToast(
              context: context,
              title: errorData.titleCreator(context),
              content: errorData.contentCreator(context),
            );
          }
        },
        contentMessage: contentMessage,
        errorDataBuilders: errorDataBuilders,
        showDefaultErrorAlertDialogOnUnhandledError:
            createDefaultErrorDataUnhandledError,
        showProgressDialog: showProgressDialog,
        cancelable: cancelable,
      );

  static ErrorData? socketErrorAlertDialogBuilder(
    BuildContext? context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is SocketException) {
      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleCreator: (context) =>
            S.of(context).app_async_socket_error_dialog_title,
        contentCreator: (context) =>
            S.of(context).app_async_socket_error_dialog_content,
      );
    } else {
      return null;
    }
  }

  static ErrorData? timeoutErrorAlertDialogBuilder(
    BuildContext? context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is TimeoutException) {
      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleCreator: (context) =>
            S.of(context).app_async_timeout_error_dialog_title,
        contentCreator: (context) =>
            S.of(context).app_async_timeout_error_dialog_content,
      );
    } else {
      return null;
    }
  }
}
