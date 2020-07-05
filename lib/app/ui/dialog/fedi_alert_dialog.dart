import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showFediAlertDialog({
  /// A build context. Required.
  @required BuildContext context,

  /// The title of the modal dialog.
  String title,

  /// The body (or content) of the modal dialog.
  /// The text was automatically rendered in a ScrollView.
  String body,

  /// A List of actions. For each action there was shown one button.
  /// If there was no action defined, a default action with a
  /// (localized) "OK" button was shown.
  List<AlertAction> actions,

  /// Allow you to define if the alert dialog is closable when
  /// the users taps beside the alert dialog.
  /// Default is only true when cancelable is set to true
  /// and the platform is not iOS.
  bool barrierDismissible,

  /// Automatically adds a (localized) "Cancel" button to the list
  /// of buttons. Currently its not possible to handle the cancel
  /// button.
  /// Only if this option was set to true. The default is false.
  bool cancelable = false,
}) {
  if (Platform.isIOS) {
    _showCupertinoAlert(
      context: context,
      title: title,
      body: body,
      actions: actions,
      barrierDismissible: barrierDismissible,
      cancelable: cancelable,
    );
  } else {
    _showMaterialAlert(
      context: context,
      title: title,
      body: body,
      actions: actions,
      barrierDismissible: barrierDismissible,
      cancelable: cancelable,
    );
  }
}

/// Shows an alert dialog with the official flutter cupertino package.
void _showCupertinoAlert({
  /// A build context. Required.
  @required BuildContext context,

  /// The title of the modal dialog.
  String title,

  /// The body (or content) of the modal dialog.
  /// The text was automatically rendered in a ScrollView.
  String body,

  /// A List of actions. For each action there was shown one button.
  /// If there was no action defined, a default action with a
  /// (localized) "OK" button was shown.
  List<AlertAction> actions,

  /// Allow you to define if the alert dialog is closable when
  /// the users taps beside the alert dialog.
  /// Default is only true when cancelable is set to true
  /// and the platform is not iOS.
  bool barrierDismissible,

  /// Automatically adds a (localized) "Cancel" button to the list
  /// of buttons. Currently its not possible to handle the cancel
  /// button.
  /// Only if this option was set to true. The default is false.
  bool cancelable = false,
}) {
  if (actions == null || actions.isEmpty) {
    actions = [
      AlertAction(
          text: MaterialLocalizations.of(context).okButtonLabel,
          onPressed: () {})
    ];
  }
  barrierDismissible ??= cancelable && !Platform.isIOS;
  if (cancelable) {
    actions.add(AlertAction(
        text: MaterialLocalizations.of(context)
                .cancelButtonLabel
                .substring(0, 1) +
            MaterialLocalizations.of(context)
                .cancelButtonLabel
                .substring(1)
                .toLowerCase(),
        onPressed: () {}));
  }

  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: _buildTitle(title),
      content: _buildBody(body),
      actions: actions
          .map((AlertAction action) =>
              _buildCupertinoActionButton(context, action))
          .toList(),
    ),
  );
}

Widget _buildCupertinoActionButton(BuildContext context, AlertAction action) {
  VoidCallback onPressed = () {
    if (action.automaticallyPopNavigation) {
      NavigatorState navigatorState = Navigator.of(context);
      if (navigatorState.canPop()) {
        navigatorState.pop();
      }
    }
    if (action.onPressed != null) {
      action.onPressed();
    }
  };

  return CupertinoDialogAction(
    child: Text(
      action.text ?? "",
      style: action.isDefaultAction
          ? TextStyle(fontWeight: FontWeight.bold)
          : null,
    ),
    isDefaultAction: action.isDefaultAction,
    isDestructiveAction: action.isDestructiveAction,
    onPressed: onPressed,
  );
}

/// An action configuration object. For each button in an alert dialog
/// one set of options and one callback handles should be defined.
class AlertAction {
  /// The title of the alert button.
  /// Required.
  final String text;

  /// Defines if the button is the default button.
  /// Set this value to true to render the button with a bold text weight.
  /// The default value is false.
  final bool isDefaultAction;

  /// Defines if the button is a destructive or dangerous button.
  /// Set this value to true to render this button with a red text color.
  /// The default value is false.
  final bool isDestructiveAction;

  /// Callback handler when this button was pressed.
  final VoidCallback onPressed;

  /// Defines if the button will automatically close the dialog by
  /// trigger a Navigation pop action or not.
  /// The default value is true.
  final bool automaticallyPopNavigation;

  const AlertAction({
    /// The title of the alert button.
    /// Required.
    @required this.text,

    /// Defines if the button is the default button.
    /// Set this value to true to render the button with a bold text weight.
    /// The default value is false.
    this.isDefaultAction = false,

    /// Defines if the button is a destructive or dangerous button.
    /// Set this value to true to render this button with a red text color.
    /// The default value is false.
    this.isDestructiveAction = false,

    /// Callback handler when this button was pressed.
    @required this.onPressed,

    /// Defines if the button will automatically close the dialog by
    /// trigger a Navigation pop action or not.
    /// The default value is true.
    this.automaticallyPopNavigation = true,
  });
}

/// Shows an alert dialog with the official flutter material package.
void _showMaterialAlert({
  /// A build context. Required.
  @required BuildContext context,

  /// The title of the modal dialog.
  String title,

  /// The body (or content) of the modal dialog.
  /// The text was automatically rendered in a ScrollView.
  String body,

  /// A List of actions. For each action there was shown one button.
  /// If there was no action defined, a default action with a
  /// (localized) "OK" button was shown.
  List<AlertAction> actions,

  /// Allow you to define if the alert dialog is closable when
  /// the users taps beside the alert dialog.
  /// Default is only true when cancelable is set to true
  /// and the platform is not iOS.
  bool barrierDismissible,

  /// Automatically adds a (localized) "Cancel" button to the list
  /// of buttons. Currently its not possible to handle the cancel
  /// button.
  /// Only if this option was set to true. The default is false.
  bool cancelable = false,
}) {
  if (actions == null || actions.isEmpty) {
    actions = [
      AlertAction(
          text: MaterialLocalizations.of(context).okButtonLabel,
          onPressed: () {})
    ];
  }
  barrierDismissible ??= cancelable && !Platform.isIOS;
  if (cancelable) {
    actions.add(AlertAction(
        text: MaterialLocalizations.of(context)
                .cancelButtonLabel
                .substring(0, 1) +
            MaterialLocalizations.of(context)
                .cancelButtonLabel
                .substring(1)
                .toLowerCase(),
        onPressed: () {}));
  }

  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) => AlertDialog(
      title: _buildTitle(title),
      content: _buildBody(body),
      actions: actions
          .map((AlertAction action) =>
              _buildMaterialActionButton(context, action))
          .toList(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
    ),
  );
}

Widget _buildTitle(String title) {
  if (title == null || title.isEmpty) {
    return null;
  }
  return Text(title);
}

Widget _buildBody(String body) {
  if (body == null || body.isEmpty) {
    return null;
  }
  return SingleChildScrollView(child: Text(body));
}

Widget _buildMaterialActionButton(BuildContext context, AlertAction action) {
  VoidCallback onPressed = () {
    if (action.automaticallyPopNavigation) {
      NavigatorState navigatorState = Navigator.of(context);
      if (navigatorState.canPop()) {
        navigatorState.pop();
      }
    }
    if (action.onPressed != null) {
      action.onPressed();
    }
  };

  return FlatButton(
    child: Text(
      action.text != null ? action.text.toUpperCase() : "",
      style: action.isDefaultAction
          ? TextStyle(fontWeight: FontWeight.bold)
          : null,
    ),
    textColor: action.isDestructiveAction ? Colors.red.shade600 : null,
    highlightColor: action.isDestructiveAction ? Colors.red.shade50 : null,
    onPressed: onPressed,
  );
}
