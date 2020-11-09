import 'package:flutter/cupertino.dart';

typedef DialogActionCallback = Function(BuildContext context);
typedef DialogActionEnabledFetcher = bool Function(BuildContext context);
typedef DialogActionEnabledStreamFetcher = Stream<bool> Function(
    BuildContext context);

class DialogAction {
  final String label;
  final IconData icon;
  final DialogActionCallback onAction;

  final DialogActionEnabledFetcher isActionEnabledFetcher;
  final DialogActionEnabledStreamFetcher isActionEnabledStreamFetcher;

  DialogAction({
    @required this.label,
    this.icon,
    @required this.onAction,
    this.isActionEnabledFetcher,
    this.isActionEnabledStreamFetcher,
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
    DialogActionEnabledFetcher isActionEnabledFetcher,
    DialogActionEnabledStreamFetcher isActionEnabledStreamFetcher,
  }) : super(
          label: label,
          icon: icon,
          onAction: onAction,
          isActionEnabledFetcher: isActionEnabledFetcher,
          isActionEnabledStreamFetcher: isActionEnabledStreamFetcher,
        );
}
