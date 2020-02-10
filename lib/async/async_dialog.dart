import 'package:async/async.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

Logger _logger = Logger("async_dialog.dart");

Future<AsyncDialogResult<T>> doAsyncOperationWithDialog<T>(
    {   @required BuildContext context,
  @required Future<T> asyncCode(),
  @required T cancellationValue,
  @required bool isDismissible,
  Widget title,
  Widget content,
  Widget cancelAction,
}) async {
  T result;
  var cancelableOperation = CancelableOperation.fromFuture(asyncCode());
  var progressDialog = _AsyncProgressDialog(
      cancelableOperation: cancelableOperation,
      title: title,
      content: content,
      cancelAction: cancelAction);
  progressDialog.show(context);
  try {
    result = await cancelableOperation.valueOrCancellation(cancellationValue);
  } finally {
    progressDialog.hide(context);

  }

  var dialogResult = AsyncDialogResult(result, cancelableOperation.isCanceled);
  return dialogResult;
}

class _AsyncProgressDialog {
  bool _isShowing = false;
  final CancelableOperation cancelableOperation;

  bool get isShowing => _isShowing;

  final Widget title;
  final Widget content;
  final Widget cancelAction;

  _AsyncProgressDialog(
      {this.cancelableOperation, this.title, this.content, this.cancelAction});

  bool hide(BuildContext context) {
    bool result;
    if (_isShowing) {
      try {
        _isShowing = false;
        Navigator.of(context).pop();
        result = true;
      } catch (e) {
        _logger.shout(() => "failed to dismiss dialog $e");
        result = false;
      }
    } else {
      result = false;
    }
    return result;
  }

  void show(BuildContext context) {
    if (!_isShowing) {
      _isShowing = true;

      showDialog(
        context: context,
        builder: (BuildContext context) {
//          _dismissingContext = context;

          List<Widget> actions = [];
          if (cancelableOperation != null) {
            actions.add(FlatButton(
                child: cancelAction ??
                    Text(AppLocalizations.of(context)
                        .tr("dialog.async.action.cancel")),
                onPressed: () {
                  cancelableOperation.cancel();
                  hide(context);
                }));
          }

          return AlertDialog(
            title: title ??
                Text(AppLocalizations.of(context)
                    .tr("dialog.async.title")),
            content: content ??
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[CircularProgressIndicator()]),
            actions: actions,
          );
        },
      );
    }
  }
}

class AsyncDialogResult<T> {
  final T result;
  final bool canceled;

  bool get isNotCanceled => !canceled;

  AsyncDialogResult(this.result, this.canceled);

  @override
  String toString() {
    return 'AsyncDialogResult{result: $result, canceled: $canceled}';
  }
}
