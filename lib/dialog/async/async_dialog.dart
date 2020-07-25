import 'package:async/async.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/app/ui/progress/fedi_indeterminate_progress_dialog.dart';
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

typedef void ErrorCallback(BuildContext context, ErrorData errorData);

Future<AsyncDialogResult<T>> doAsyncOperationWithDialog<T>({
  @required BuildContext context,
  @required Future<T> asyncCode(),
  @required ErrorCallback errorCallback,
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
    progressDialog = FediIndeterminateProgressDialog(
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
          "doAsyncOperationWithFediDialog");
    } else {
      _logger.warning(
          () => "handled error during "
              "doAsyncOperationWithFediDialog",
          error,
          stackTrace);
    }
  } finally {
    progressDialog?.hide(context);
  }

  AsyncDialogResult dialogResult;
  if (progressDialog?.isCanceled == true) {
    dialogResult = AsyncDialogResult<T>.canceled();
    _logger.fine(() => "canceled doAsyncOperationWithFediDialog");
  } else if (error != null) {
    if (errorData != null) {
      if (errorCallback != null) {
        errorCallback(context, errorData);
      }
    }

    if (needRethrow) {
      throw error;
    }
    dialogResult = AsyncDialogResult<T>.withError(error);
  } else {
    _logger.finest(() => "success doAsyncOperationWithFediDialog =$result}");
    dialogResult = AsyncDialogResult<T>.success(result);
  }

  return dialogResult;
}
