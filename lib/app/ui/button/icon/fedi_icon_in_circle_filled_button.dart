import 'dart:ui';

import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediIconInCircleFilledButton extends StatelessWidget
    implements FediIconInCircleButton {
  final IconData iconData;
  final VoidCallback onPressed;
  final double iconSize;
  final double borderWidth;
  final double size;

  const FediIconInCircleFilledButton(
    this.iconData, {
    @required this.onPressed,
    this.borderWidth = 1.0,
    this.iconSize = FediIconInCircleButton.defaultIconSize,
    this.size = FediIconInCircleButton.defaultCircleSize,
  });

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        onPressed != null ? FediColors.primaryColor : FediColors.white;
    var borderColor =
        onPressed != null ? FediColors.white : FediColors.lightGrey;
    var iconColor = onPressed != null ? FediColors.white : FediColors.lightGrey;
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
        child: IconButton(
          padding: EdgeInsets.all(0.0),
          icon: Icon(
            iconData,
            size: iconSize,
            color: iconColor,
          ),
          onPressed: onPressed,
        ));
  }
}
