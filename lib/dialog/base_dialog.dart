import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class IDialog {
  bool get isShowing;

  bool get cancelable;

  Future show(BuildContext context);

  Future hide(BuildContext context);
}

abstract class BaseDialog extends DisposableOwner implements IDialog {
  @override
  final bool cancelable;

  BaseDialog({this.cancelable = true});

  bool _isShowing = false;

  @override
  bool get isShowing => _isShowing;

  @override
  Future show(BuildContext context) {
    assert(!isShowing);
    _isShowing = true;
    return showDialog(
      barrierDismissible: cancelable,
      context: context,
      builder: (BuildContext context) => buildDialogBody(context),
    );
  }

  @override
  Future hide(BuildContext context) async {
    assert(isShowing);
    _isShowing = false;
    await dispose();
    Navigator.of(context).pop();
  }

  Widget buildDialogBody(BuildContext context);

  static DialogAction createDefaultCancelAction({
    @required BuildContext context,
  }) =>
      DialogAction(
        onAction: (context) {
          Navigator.of(context).pop();
        },
        label: tr("dialog.action.cancel"),
      );

  static DialogAction createDefaultOkAction({
    @required BuildContext context,
    @required DialogActionCallback action,
    DialogActionEnabledFetcher isActionEnabledFetcher,
    DialogActionEnabledStreamFetcher isActionEnabledStreamFetcher,
  }) =>
      DialogAction(
        onAction: (context) {
          if (action != null) {
            action(context);
          }
          Navigator.of(context).pop();
        },
        label: tr("dialog.action.ok"),
        isActionEnabledFetcher: isActionEnabledFetcher,
        isActionEnabledStreamFetcher: isActionEnabledStreamFetcher,
      );
}
