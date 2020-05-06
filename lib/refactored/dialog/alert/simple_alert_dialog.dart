import 'package:fedi/refactored/dialog/alert/base_alert_dialog.dart';
import 'package:fedi/refactored/dialog/base_dialog.dart';
import 'package:flutter/widgets.dart';

class SimpleAlertDialog extends BaseAlertDialog {
  SimpleAlertDialog({
    @required BuildContext context,
    String title,
    String content,
  }) : super(title: title, content: content, cancelable: true);

  @override
  Widget buildCancelAction(BuildContext context) =>
      buildButton(context, createOkCancelAction(context));
}
