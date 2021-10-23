import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/dialog/dialog_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/ui/callback/on_click_ui_callback.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class IDialog {
  bool get isShowing;

  bool get cancelable;

  Future<T?> show<T>(BuildContext context);

  Future<void> hide(BuildContext context);
}

abstract class BaseDialog extends DisposableOwner implements IDialog {
  @override
  final bool cancelable;

  BaseDialog({this.cancelable = true});

  bool _isShowing = false;

  @override
  bool get isShowing => _isShowing;

  @override
  Future<T?> show<T>(BuildContext context) async {
    assert(!isShowing, 'cant show when already shown');
    _isShowing = true;
    var result = await showDialog<T>(
      barrierDismissible: cancelable,
      context: context,
      builder: buildDialogBody,
    );
    await dispose();

    return result;
  }

  @override
  Future<void> hide(BuildContext context) async {
    assert(isShowing, 'Cant hide not showed dialog');
    _isShowing = false;
    await dispose();
    Navigator.of(context).pop();
  }

  Widget buildDialogBody(BuildContext context);

  static DialogAction createDefaultCancelAction({
    required BuildContext context,
    OnClickUiCallback? customCallback,
  }) =>
      DialogAction(
        onAction: (context) {
          if (customCallback != null) {
            customCallback(context);
          } else {
            Navigator.of(context).pop();
          }
        },
        label: S.of(context).dialog_action_cancel,
      );

  static DialogAction createDefaultOkAction({
    required BuildContext context,
    required DialogActionCallback? action,
    DialogActionEnabledFetcher? isActionEnabledFetcher,
    DialogActionEnabledStreamFetcher? isActionEnabledStreamFetcher,
  }) =>
      DialogAction(
        onAction: (context) {
          if (action != null) {
            action(context);
          }
          Navigator.of(context).pop();
        },
        label: S.of(context).dialog_action_ok,
        isActionEnabledFetcher: isActionEnabledFetcher,
        isActionEnabledStreamFetcher: isActionEnabledStreamFetcher,
      );
}
