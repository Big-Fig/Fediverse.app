import 'package:async/async.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/ui/error/fedi_error_data_notification_overlay.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/dialog/progress/indeterminate_progress_dialog.dart';
import 'package:fedi/error/error_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

Logger _logger = Logger("async_dialog.dart");

typedef ErrorData ErrorDataBuilder(
  BuildContext context,
  dynamic error,
  StackTrace stackTrace,
);

Future<AsyncDialogResult<T>> doAsyncOperationWithDialog<T>({
  @required BuildContext context,
  @required Future<T> asyncCode(),
  String contentMessage,
  List<ErrorDataBuilder> errorDataBuilders = const [],
  bool showDefaultErrorAlertDialogOnUnhandledError = true,
  bool showProgressDialog = true,
  bool cancelable = false,
}) async {
  T result;
  CancelableOperation<T> cancelableOperation =
      CancelableOperation.fromFuture(asyncCode());

  var progressDialog;
  if (showProgressDialog) {
    progressDialog = IndeterminateProgressDialog(
        cancelable: cancelable,
        contentMessage: contentMessage ?? tr("dialog.progress.content"),
        cancelableOperation: cancelableOperation);
    progressDialog.show(context);
  }

  var error;
  ErrorData errorData;

  var needRethrow = true;

  try {
    result = await cancelableOperation.valueOrCancellation(null);
  } catch (e, stackTrace) {
    error = e;
    for (ErrorDataBuilder builder in errorDataBuilders ?? []) {
      errorData = builder(context, e, stackTrace);
      if (errorData != null) {
        needRethrow = false;
        break;
      }
    }

    if (errorData == null && showDefaultErrorAlertDialogOnUnhandledError) {
      errorData = ErrorData(
        titleText: tr("dialog.error.title"),
        contentText: tr("dialog.error.content", args: [error.toString()]),
        stackTrace: null,
        error: null,
      );
    }

    if (needRethrow) {
      _logger.severe(() => "rethrow error during "
          "doAsyncOperationWithDialog");
    } else {
      _logger.warning(
          () => "handled error during "
              "doAsyncOperationWithDialog",
          error,
          stackTrace);
    }
  } finally {
    progressDialog?.hide(context);
  }

  AsyncDialogResult dialogResult;
  if (progressDialog?.isCanceled == true) {
    dialogResult = AsyncDialogResult<T>.canceled();
    _logger.fine(() => "canceled doAsyncOperationWithDialog");
  } else if (error != null) {
    if (errorData != null) {
      showFediErrorDataNotificationOverlay(
        titleText: errorData.titleText,
        contentText: errorData.contentText,
      );
    }

    if (needRethrow) {
      throw error;
    }
    dialogResult = AsyncDialogResult<T>.withError(error);
  } else {
    _logger.finest(() => "success doAsyncOperationWithDialog =$result}");
    dialogResult = AsyncDialogResult<T>.success(result);
  }

  return dialogResult;
}
