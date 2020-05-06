import 'package:fedi/refactored/dialog/base_dialog.dart';
import 'package:fedi/refactored/dialog/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseAlertDialog extends BaseDialog {
  final String title;
  final String content;
  final List<DialogAction> actions;

  BaseAlertDialog(
      {this.title, this.content, this.actions, bool cancelable = true})
      : super(cancelable: cancelable);

  FlatButton buildButton(BuildContext context, DialogAction action) =>
      FlatButton(
        child: Text(action.label),
        onPressed: action.onAction,
      );

  @override
  Widget buildDialog(BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelable) buildCancelAction(context),
          ...actions?.map((action) => buildButton(context, action))?.toList() ??
              []
        ],
      );

  Widget buildCancelAction(BuildContext context) =>
      buildButton(context, createDefaultCancelAction(context));
}
