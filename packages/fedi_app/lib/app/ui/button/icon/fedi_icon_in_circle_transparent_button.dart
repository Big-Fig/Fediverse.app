import 'dart:ui';

import 'package:fedi_app/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class FediIconInCircleTransparentButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback? onPressed;
  final double iconSize;
  final double borderWidth;
  final double size;
  final Color color;

  // todo: refactor key
  const FediIconInCircleTransparentButton(
    this.iconData, {
    Key? key,
    required this.onPressed,
    required this.color,
    this.borderWidth = 1.0,
    this.iconSize = FediSizes.iconInCircleDefaultIconSize,
    this.size = FediSizes.iconInCircleDefaultSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);

    return Container(
      // ignore: no-magic-number
      width: size + borderWidth * 2,
      // ignore: no-magic-number, no-equal-arguments
      height: size + borderWidth * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: fediUiColorTheme.transparent,
        border: Border.all(
          color: color,
          width: borderWidth,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: FediIconButton(
          padding: EdgeInsets.zero,
          icon: Icon(iconData, size: iconSize, color: color),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
