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
  final Key? key;
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
    this.key,
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
}

class SelectionDialogAction extends DialogAction {
  final bool isSelected;

  SelectionDialogAction({
    required Key? key,
    required this.isSelected,
    required String? label,
    IconData? icon,
    TextStyle? customTextStyle,
    required DialogActionCallback? onAction,
    DialogActionEnabledFetcher? isActionEnabledFetcher,
    DialogActionEnabledStreamFetcher? isActionEnabledStreamFetcher,
  }) : super(
          key: key,
          label: label,
          icon: icon,
          customTextStyle: customTextStyle,
          onAction: onAction,
          isActionEnabledFetcher: isActionEnabledFetcher,
          isActionEnabledStreamFetcher: isActionEnabledStreamFetcher,
        );
}
