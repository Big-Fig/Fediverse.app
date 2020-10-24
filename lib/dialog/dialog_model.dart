import 'package:flutter/cupertino.dart';

typedef DialogActionCallback = Function(BuildContext context);

class DialogAction {
  final String label;
  final IconData icon;
  final DialogActionCallback onAction;

  DialogAction({
    @required this.label,
    this.icon,
    @required this.onAction,
  });

  @override
  String toString() {
    return 'DialogAction{label: $label, icon: $icon, onAction: $onAction}';
  }
}

class SelectionDialogAction extends DialogAction {
  final bool isSelected;

  SelectionDialogAction({
    @required this.isSelected,
    @required String label,
    IconData icon,
    @required DialogActionCallback onAction,
  }) : super(
          label: label,
          icon: icon,
          onAction: onAction,
        );
}
