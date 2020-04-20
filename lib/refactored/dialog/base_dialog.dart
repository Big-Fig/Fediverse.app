import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/dialog/dialog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class BaseDialog {
  final bool cancelable;

  BaseDialog({this.cancelable = true});

  bool _isShowing = false;

  bool get isShowing => _isShowing;

  show(BuildContext context) {
    assert(!isShowing);
    showDialog(
        barrierDismissible: cancelable,
        context: context,
        builder: (BuildContext context) => buildDialog(context));
  }

  hide(BuildContext context) {
    assert(isShowing);
    Navigator.of(context).pop();
  }

  Widget buildDialog(BuildContext context);
}

DialogAction createdDefaultCancelAction(BuildContext context) {
  return DialogAction(
      onAction: () {
        Navigator.of(context).pop();
      },
      title: AppLocalizations.of(context).tr("dialog.action.cancel"));
}
