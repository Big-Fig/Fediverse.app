import 'package:async/async.dart';
import 'package:fedi/app/ui/progress/fedi_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndeterminateProgressDialog extends ProgressDialog {
  IndeterminateProgressDialog(
      {String contentMessage,
      bool cancelable = false,
      @required CancelableOperation cancelableOperation})
      : super(
            titleMessage: contentMessage,
            cancelable: cancelable,
            cancelableOperation: cancelableOperation);

  @override
  Widget buildDialogTitle(BuildContext context) =>
      buildDialogTitleMessage(context);
}
