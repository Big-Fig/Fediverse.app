import 'package:fedi/refactored/app/dialog/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAlertDialog {
  final String title;
  final String content;
  final List<DialogAction> actions;
  final bool cancelable;

  MyAlertDialog(
      {this.title, this.content, this.actions, this.cancelable = true});

  show(BuildContext context) {
    showDialog(
        barrierDismissible: cancelable,
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(this.title),
              content: Text(this.content),
              actions: <Widget>[
                if (cancelable)
                  buildButton(context, DialogAction
                      .createdDefaultCancelAction(context)),
                actions?.map((action) => buildButton(context, action)) ?? []
              ],
            ));
  }

  FlatButton buildButton(BuildContext context, DialogAction action) =>
      FlatButton(
        child: Text(action.title),
        onPressed: action.onAction,
      );
}
