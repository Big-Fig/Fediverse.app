import 'dart:ui';

import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/app/ui/button/text/fedi_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediPrimaryFilledTextButton extends FediTextButton {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double fontSize;
  final double lineHeight;

  FediPrimaryFilledTextButton(
    this.text, {
    @required this.onPressed,
    this.height = FediSizes.defaultFilledButtonHeight,
    this.fontSize = 14.0,
    this.lineHeight = 1.15,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: onPressed != null
                ? FediColors.primaryColor
                : FediColors.lightGrey,
            borderRadius: BorderRadius.all(
                Radius.circular(FediIconInCircleButton.defaultCircleSize)),
            border: Border.all(
              color: FediColors.white,
              width: 1.0,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                text, textAlign: TextAlign.center, // 80% transparency
                style: TextStyle(
                    fontSize: fontSize,
                    height: lineHeight,
                    fontWeight: FontWeight.w500,
                    color: FediColors.white),
              ),
            ),
          )),
    );
  }
}
