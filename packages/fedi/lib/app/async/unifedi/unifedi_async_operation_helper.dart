import 'package:fedi/app/async/async_operation_helper.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:unifedi_api/unifedi_api.dart';

class UnifediAsyncOperationHelper {
  static const List<ErrorDataBuilder> unifediErrorDataBuilders = [
    unifediThrottledErrorAlertDialogBuilder,
    unifediInvalidCredentialsErrorAlertDialogBuilder,
    unifediErrorAlertDialogBuilder,
    ...AsyncOperationHelper.defaultErrorDataBuilders,
  ];

  // ignore: long-parameter-list
  static Future<AsyncDialogResult<T?>> performUnifediAsyncOperation<T>({
    required BuildContext context,
    required Future<T> Function() asyncCode,
    String? contentMessage,
    List<ErrorDataBuilder> errorDataBuilders = unifediErrorDataBuilders,
    bool createDefaultErrorDataUnhandledError = true,
    bool showNotificationOnError = true,
    bool showProgressDialog = true,
    ErrorCallback? errorCallback,
    bool cancelable = false,
  }) =>
      AsyncOperationHelper.performAsyncOperation(
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

  static ErrorData? unifediThrottledErrorAlertDialogBuilder(
    BuildContext context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is IUnifediApiRestErrorException) {
      var statusCode = error.unifediError.restResponseError.statusCode;

      if (statusCode ==
          RestResponseClientErrorCodeType.tooManyRequestsValue.intValue) {
        return ErrorData(
          error: error,
          stackTrace: stackTrace,
          titleCreator: (context) =>
              S.of(context).app_async_unifedi_error_throttled_dialog_title,
          contentCreator: (context) =>
              S.of(context).app_async_unifedi_error_throttled_dialog_content,
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static ErrorData? unifediInvalidCredentialsErrorAlertDialogBuilder(
    BuildContext? context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is IUnifediApiRestErrorException) {
      var statusCode = error.unifediError.restResponseError.statusCode;
      var descriptionOrContent = error.unifediError.descriptionOrContent;
      if (statusCode ==
          RestResponseClientErrorCodeType.forbiddenValue.intValue) {
        return ErrorData(
          error: error,
          stackTrace: stackTrace,
          titleCreator: (context) =>
              S.of(context).app_async_unifedi_error_forbidden_dialog_title,
          contentCreator: descriptionOrContent != null
              ? (context) => S
                  .of(context)
                  .app_async_unifedi_error_forbidden_dialog_content(
                    descriptionOrContent,
                  )
              : null,
        );
      } else {
        return null;
      }
    }
  }

  static ErrorData? unifediErrorAlertDialogBuilder(
    BuildContext? context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is IUnifediApiRestErrorException) {
      var descriptionOrContent = error.unifediError.descriptionOrContent;

      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleCreator: (context) =>
            S.of(context).app_async_unifedi_error_common_dialog_title,
        contentCreator: descriptionOrContent != null
            ? (context) =>
                S.of(context).app_async_unifedi_error_common_dialog_content(
                      descriptionOrContent,
                    )
            : null,
      );
    } else {
      return null;
    }
  }
}
