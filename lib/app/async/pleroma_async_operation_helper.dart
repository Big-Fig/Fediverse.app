import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/async/async_operation_helper.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/dialog/async/async_dialog.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("pleroma_async_operation_helper.dart");

class PleromaAsyncOperationHelper {
  static const List<ErrorDataBuilder> pleromaErrorDataBuilders = [
    pleromaThrottledErrorAlertDialogBuilder,
    pleromaInvalidCredentialsErrorAlertDialogBuilder,
    pleromaErrorAlertDialogBuilder,
    ...AsyncOperationHelper.defaultErrorDataBuilders,
  ];

  static Future<AsyncDialogResult<T>> performPleromaAsyncOperation<T>({
    @required BuildContext context,
    @required Future<T> asyncCode(),
    String contentMessage,
    List<ErrorDataBuilder> errorDataBuilders = pleromaErrorDataBuilders,
    bool createDefaultErrorDataUnhandledError = true,
    bool showNotificationOnError = true,
    bool showProgressDialog = true,
    ErrorCallback errorCallback,
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
        
        if (errorData.error is PleromaInvalidCredentialsRestException) {
          // todo: if auto-logout needed in all invalid credentials cases
          _autoLogoutOnSessionExpired(context);
        }

        if (errorCallback != null) {
          errorCallback(context, errorData);
        }
      },
      cancelable: cancelable,
    );
  }

  static void _autoLogoutOnSessionExpired(BuildContext context) {
       try {
      var currentAuthInstanceBloc =
          ICurrentAuthInstanceBloc.of(context, listen: false);
      currentAuthInstanceBloc.logoutCurrentInstance();
    } catch (e, stackTrace) {
      _logger.warning(
          () => "failed to logout on invalid credentials", e, stackTrace);
    }
  }

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
  static ErrorData pleromaInvalidCredentialsErrorAlertDialogBuilder(
    BuildContext context,
    dynamic error,
    StackTrace stackTrace,
  ) {
    if (error is PleromaInvalidCredentialsRestException) {
      return ErrorData(
        error: error,
        stackTrace: stackTrace,
        titleText: tr("app.async.pleroma.error.invalid_credentials.dialog"
            ".title"),
        contentText: tr("app.async.pleroma.error.invalid_credentials.dialog.content"),
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
}
