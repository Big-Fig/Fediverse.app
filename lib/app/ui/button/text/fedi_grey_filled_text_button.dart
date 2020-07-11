import 'dart:ui';

import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediGreyFilledTextButton extends StatelessWidget {
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
    this.height = FediSizes.textButtonHeight,
    this.fontSize = 14.0,
    this.lineHeight = 1.15,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: height + borderWidth * 2,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: onPressed != null
                ? FediColors.ultraLightGrey
                : FediColors.lightGrey,
            borderRadius: BorderRadius.all(
                Radius.circular(FediSizes.textButtonRadiusCircle)),
            border: Border.all(
              color: FediColors.white,
              width: borderWidth,
            ),
          ),
          child: Center(
            child: Padding(
              padding: FediPadding.buttonHorizontalPadding,
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
