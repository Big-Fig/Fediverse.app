import 'package:flutter/cupertino.dart';

typedef DialogActionCallback = Function(BuildContext context);
typedef DialogActionEnabledFetcher = bool Function(BuildContext context);
typedef DialogActionEnabledStreamFetcher = Stream<bool> Function(
  BuildContext context,
);
typedef DialogActionVisibleFetcher = bool Function(BuildContext context);
typedef DialogActionVisibleStreamFetcher = Stream<bool> Function(
  BuildContext context,
);

class DialogAction {
  final String? label;
  final IconData? icon;

  final TextStyle? customTextStyle;
  final Color? customColor;
  final DialogActionCallback? onAction;

  final DialogActionEnabledFetcher? isActionEnabledFetcher;
  final DialogActionEnabledStreamFetcher? isActionEnabledStreamFetcher;

  final DialogActionVisibleFetcher? isActionVisibleFetcher;
  final DialogActionVisibleStreamFetcher? isActionVisibleStreamFetcher;

  DialogAction({
    required this.label,
    this.icon,
    required this.onAction,
    this.customTextStyle,
    this.customColor,
    this.isActionEnabledFetcher,
    this.isActionEnabledStreamFetcher,
    this.isActionVisibleFetcher,
    this.isActionVisibleStreamFetcher,
  });

  @override
  String toString() {
    return 'DialogAction{'
        'label: $label, icon: $icon, '
        'customTextStyle: $customTextStyle, '
        'onAction: $onAction, '
        'isActionEnabledFetcher: $isActionEnabledFetcher, '
        'isActionEnabledStreamFetcher: $isActionEnabledStreamFetcher '
        'isActionVisibleFetcher: $isActionVisibleFetcher, '
        'isActionVisibleStreamFetcher: $isActionVisibleStreamFetcher'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DialogAction &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          icon == other.icon &&
          customTextStyle == other.customTextStyle &&
          customColor == other.customColor &&
          onAction == other.onAction &&
          isActionEnabledFetcher == other.isActionEnabledFetcher &&
          isActionEnabledStreamFetcher == other.isActionEnabledStreamFetcher &&
          isActionVisibleFetcher == other.isActionVisibleFetcher &&
          isActionVisibleStreamFetcher == other.isActionVisibleStreamFetcher;

  @override
  int get hashCode =>
      label.hashCode ^
      icon.hashCode ^
      customTextStyle.hashCode ^
      customColor.hashCode ^
      onAction.hashCode ^
      isActionEnabledFetcher.hashCode ^
      isActionEnabledStreamFetcher.hashCode ^
      isActionVisibleFetcher.hashCode ^
      isActionVisibleStreamFetcher.hashCode;


}

class SelectionDialogAction extends DialogAction {
  final bool isSelected;

  SelectionDialogAction({
    required this.isSelected,
    required String? label,
    IconData? icon,
    TextStyle? customTextStyle,
    required DialogActionCallback? onAction,
    DialogActionEnabledFetcher? isActionEnabledFetcher,
    DialogActionEnabledStreamFetcher? isActionEnabledStreamFetcher,
  }) : super(
          label: label,
          icon: icon,
          customTextStyle: customTextStyle,
          onAction: onAction,
          isActionEnabledFetcher: isActionEnabledFetcher,
          isActionEnabledStreamFetcher: isActionEnabledStreamFetcher,
        );
}
