import 'dart:ui';

import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/app/ui/button/text/fedi_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediTransparentTextButton extends StatelessWidget
    implements FediTextButton {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double fontSize;
  final double lineHeight;
  final double borderWidth;

  const FediTransparentTextButton(
    this.text, {
    @required this.onPressed,
    this.height = FediSizes.defaultFilledButtonHeight,
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
            color: FediColors.darkGrey.withOpacity(0.3),
            borderRadius: BorderRadius.all(
                Radius.circular(FediIconInCircleButton.defaultCircleSize)),
            border: Border.all(
              color: FediColors.white,
              width: borderWidth,
            ),
          ),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(FediIconInCircleButton.defaultCircleSize),
            child: BackdropFilter(
              child: Center(
                child: Padding(
                  padding: FediPadding.buttonHorizontalPadding,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fontSize,
                        height: lineHeight,
                        color: FediColors.white.withOpacity(0.8)),
                  ),
                ),
              ),
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            ),
          )),
    );
  }
}
