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

  const FediIconInCircleFilledButton(this.iconData, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        onPressed != null ? FediColors.primaryColor : FediColors.white;
    var borderColor =
        onPressed != null ? FediColors.white : FediColors.lightGrey;
    var iconColor = onPressed != null ? FediColors.white : FediColors.lightGrey;
    return Container(
        width: FediIconInCircleButton.defaultCircleSize,
        height: FediIconInCircleButton.defaultCircleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
        ),
        child: IconButton(
          padding: EdgeInsets.all(0.0),
          icon: Icon(iconData,
              size: FediIconInCircleButton.defaultIconSize, color: iconColor),
          onPressed: onPressed,
        ));
  }
}
