import 'package:fedi/refactored/app/dialog/progress/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndeterminateProgressDialog extends ProgressDialog {
  IndeterminateProgressDialog({String contentMessage})
      : super(contentMessage: contentMessage);
  @override
  Widget buildDialogContent(BuildContext context) =>
      buildDialogContentMessage(context);
}
