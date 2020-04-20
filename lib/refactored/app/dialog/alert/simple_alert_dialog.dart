import 'package:fedi/refactored/app/dialog/base_dialog.dart';
import 'package:fedi/refactored/app/dialog/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleAlertDialog extends BaseDialog {
  final String title;
  final String content;
  final List<DialogAction> actions;

  SimpleAlertDialog(
      {this.title, this.content, this.actions, bool cancelable = true})
      : super(cancelable: cancelable);

  FlatButton buildButton(BuildContext context, DialogAction action) =>
      FlatButton(
        child: Text(action.title),
        onPressed: action.onAction,
      );

  @override
  Widget buildDialog(BuildContext context) => AlertDialog(
        title: Text(this.title),
        content: Text(this.content),
        actions: <Widget>[
          if (cancelable)
            buildButton(context, createdDefaultCancelAction(context)),
          ...actions?.map((action) => buildButton(context, action))?.toList() ??
              []
        ],
      );
}
