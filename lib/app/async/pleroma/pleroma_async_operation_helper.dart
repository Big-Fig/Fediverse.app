import 'package:fedi/app/async/async_operation_helper.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';
import 'package:flutter/widgets.dart';

class PleromaAsyncOperationHelper {
  static const List<ErrorDataBuilder> pleromaErrorDataBuilders = [
    pleromaThrottledErrorAlertDialogBuilder,
    pleromaInvalidCredentialsErrorAlertDialogBuilder,
    pleromaErrorAlertDialogBuilder,
    ...AsyncOperationHelper.defaultErrorDataBuilders,
  ];

  // ignore: long-parameter-list
  static Future<AsyncDialogResult<T?>> performPleromaAsyncOperation<T>({
    required BuildContext context,
    required Future<T> Function() asyncCode,
    String? contentMessage,
    List<ErrorDataBuilder> errorDataBuilders = pleromaErrorDataBuilders,
    bool createDefaultErrorDataUnhandledError = true,
    bool showNotificationOnError = true,
    bool showProgressDialog = true,
    ErrorCallback? errorCallback,
    bool cancelable = false,
  }) {
    return AsyncOperationHelper.performAsyncOperation(
      context: context,
      asyncCode: asyncCode,
      contentMessage: contentMessage,
      errorDataBuilders: errorDataBuilders,
      createDefaultErrorDataUnhandledError:
          createDefaultErrorDataUnhandledError,
      showNotificationOnError: showNotificationOnError,
      showProgressDialog: showProgressDialog,
      errorCallback: (context, errorData) {
        if (errorCallback != null) {
          errorCallback(context, errorData);
        }
      },
      cancelable: cancelable,
    );
  }

  static ErrorData? pleromaThrottledErrorAlertDialogBuilder(
    BuildContext context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is PleromaApiUnprocessableOrThrottledRestException) {
      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleCreator: (context) =>
            S.of(context).app_async_pleroma_error_throttled_dialog_title,
        contentCreator: (context) =>
            S.of(context).app_async_pleroma_error_throttled_dialog_content,
      );
    } else {
      return null;
    }
  }

  static ErrorData? pleromaInvalidCredentialsErrorAlertDialogBuilder(
    BuildContext? context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is PleromaApiForbiddenRestException) {
      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleCreator: (context) =>
            S.of(context).app_async_pleroma_error_forbidden_dialog_title,
        contentCreator: (context) =>
            S.of(context).app_async_pleroma_error_forbidden_dialog_content(
                  error.decodedErrorDescriptionOrBody,
                ),
      );
    } else {
      return null;
    }
  }

  static ErrorData? pleromaErrorAlertDialogBuilder(
    BuildContext? context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is PleromaApiRestException) {
      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleCreator: (context) =>
            S.of(context).app_async_pleroma_error_common_dialog_title,
        contentCreator: (context) =>
            S.of(context).app_async_pleroma_error_common_dialog_content(
                  error.toString(),
                ),
      );
    } else {
      return null;
    }
  }
}
