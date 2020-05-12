import 'dart:ui';

import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediIconInCircleTransparentButton extends FediIconInCircleButton {
  final IconData iconData;
  final VoidCallback onPressed;

  FediIconInCircleTransparentButton(this.iconData, {@required this.onPressed});

  @override
  Widget build(BuildContext context) => Container(
      width: FediIconInCircleButton.defaultCircleSize,
      height: FediIconInCircleButton.defaultCircleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: FediColors.darkGrey.withOpacity(0.3),
        border: Border.all(
          color: FediColors.white,
          width: 1.0,
        ),
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(FediIconInCircleButton.defaultCircleSize),
        child: BackdropFilter(
          child: IconButton(
            padding: EdgeInsets.all(0.0),
            icon: Icon(iconData,
                size: FediIconInCircleButton.defaultIconSize,
                color: FediColors.white),
            onPressed: onPressed,
          ),
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        ),
      ));
}
