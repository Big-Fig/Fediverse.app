import 'package:async/async.dart';
import 'package:fedi_app/app/ui/progress/fedi_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FediIndeterminateProgressDialog extends FediProgressDialog {
  FediIndeterminateProgressDialog({
    String? titleMessage,
    String? contentMessage,
    bool cancelable = false,
    required CancelableOperation? cancelableOperation,
  }) : super(
          titleMessage: titleMessage,
          contentMessage: contentMessage,
          cancelable: cancelable,
          cancelableOperation: cancelableOperation,
        );

  @override
  Widget buildDialogTitle(BuildContext context) =>
      buildDialogTitleMessage(context);
}
