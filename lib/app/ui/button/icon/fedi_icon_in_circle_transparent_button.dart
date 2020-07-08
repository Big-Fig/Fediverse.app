import 'dart:ui';

import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediIconInCircleTransparentButton extends StatelessWidget
    implements FediIconInCircleButton {
  final IconData iconData;
  final VoidCallback onPressed;
  final double iconSize;
  final double borderWidth;
  final double size;
  final Color color;

  const FediIconInCircleTransparentButton(
    this.iconData, {
    @required this.onPressed,
    @required this.color,
    this.borderWidth = 1.0,
    this.iconSize = FediIconInCircleButton.defaultIconSize,
    this.size = FediIconInCircleButton.defaultCircleSize,
  });

  @override
  Widget build(BuildContext context) => Container(
      width: size + borderWidth * 2,
      height: size + borderWidth * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(
          color: color,
          width: borderWidth,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size),
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(iconData, size: iconSize, color: color),
          onPressed: onPressed,
        ),
      ));
}
