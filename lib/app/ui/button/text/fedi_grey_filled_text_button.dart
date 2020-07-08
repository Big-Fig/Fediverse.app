import 'dart:ui';

import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/app/ui/button/text/fedi_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediGreyFilledTextButton extends FediTextButton {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final double height;
  final double fontSize;
  final double lineHeight;
  final double borderWidth;

  FediGreyFilledTextButton(
    this.text, {
    @required this.onPressed,
    this.textColor = FediColors.grey,
    this.height = FediSizes.defaultFilledButtonHeight,
    this.fontSize = 14.0,
    this.lineHeight = 1.15,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onPressed,
      child: Container(
          height: height + borderWidth * 2,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: onPressed != null
                ? FediColors.ultraLightGrey
                : FediColors.lightGrey,
            borderRadius: BorderRadius.all(
                Radius.circular(FediIconInCircleButton.defaultCircleSize)),
            border: Border.all(
              color: FediColors.white,
              width: borderWidth,
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: FediSizes.bigPadding),
              child: Text(
                text,
                // 80% transparency
                style: TextStyle(
                    fontSize: fontSize,
                    height: lineHeight,
                    fontWeight: FontWeight.w500,
                    color: textColor),
              ),
            ),
          )),
    );
  }
}
