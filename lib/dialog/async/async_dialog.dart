import 'package:async/async.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/dialog/alert/simple_alert_dialog.dart';
import 'package:fedi/dialog/async/async_dialog_model.dart';
import 'package:fedi/dialog/base_dialog.dart';
import 'package:fedi/dialog/progress/indeterminate_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

Logger _logger = Logger("async_dialog.dart");

typedef BaseDialog ErrorAlertDialogBuilder(BuildContext context, dynamic error);

Future<AsyncDialogResult<T>> doAsyncOperationWithDialog<T>({
  @required BuildContext context,
  @required Future<T> asyncCode(),
  String contentMessage,
  List<ErrorAlertDialogBuilder> errorAlertDialogBuilders = const [],
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
        contentMessage: contentMessage ??
            tr("dialog.progress.content"),
        cancelableOperation: cancelableOperation);
    progressDialog.show(context);
  }

  var error;
  BaseDialog errorDialog;

  var needRethrow = true;

  try {
    result = await cancelableOperation.valueOrCancellation(null);
  } catch (e, stackTrace) {
    error = e;
    for (var builder in errorAlertDialogBuilders ?? []) {
      errorDialog = builder(context, e);
      if (errorDialog != null) {
        needRethrow = false;
        break;
      }
    }

    if (errorDialog == null && showDefaultErrorAlertDialogOnUnhandledError) {
      errorDialog = SimpleAlertDialog(
        context: context,
        title: tr("dialog.error.title"),
        content: tr("dialog.error.content", args: [error.toString()]),
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
    if (errorDialog != null) {
      await errorDialog.show(context);
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
