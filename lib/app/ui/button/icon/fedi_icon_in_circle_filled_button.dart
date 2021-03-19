import 'dart:ui';

import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediIconInCircleFilledButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final double iconSize;
  final double borderWidth;
  final double size;
  final Color? enabledBackgroundColor;
  final Color? disabledBackgroundColor;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? enabledIconColor;
  final Color? disabledIconColor;

  const FediIconInCircleFilledButton(
    this.iconData, {
    required this.onPressed,
    this.enabledBackgroundColor,
    this.disabledBackgroundColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.enabledIconColor,
    this.disabledIconColor,
    this.borderWidth = 1.0,
    this.iconSize = FediSizes.iconInCircleDefaultIconSize,
    this.size = FediSizes.iconInCircleDefaultSize,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    var enabledBackgroundColor =
        this.enabledBackgroundColor ?? fediUiColorTheme.primary;
    var disabledBackgroundColor =
        this.disabledBackgroundColor ?? fediUiColorTheme.transparent;
    var enabledBorderColor = this.enabledBorderColor ?? fediUiColorTheme.white;
    var disabledBorderColor =
        this.disabledBorderColor ?? fediUiColorTheme.lightGrey;
    var enabledIconColor = this.enabledIconColor ?? fediUiColorTheme.white;
    var disabledIconColor =
        this.disabledIconColor ?? fediUiColorTheme.lightGrey;

    var backgroundColor =
        onPressed != null ? enabledBackgroundColor : disabledBackgroundColor;
    var borderColor =
        onPressed != null ? enabledBorderColor : disabledBorderColor;
    var iconColor = onPressed != null ? enabledIconColor : disabledIconColor;
    return Container(
      width: size + borderWidth * 2,
      height: size + borderWidth * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: FediIconButton(
        padding: EdgeInsets.zero,
        color: iconColor,
        icon: Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
