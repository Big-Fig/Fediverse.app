import 'dart:ui';

import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediTransparentTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double borderWidth;

  final TextStyle textStyle;
  static const TextStyle defaultTextStyle = FediTextStyles.mediumShortBoldWhite;

  const FediTransparentTextButton(
    this.text, {
    @required this.onPressed,
    this.height = FediSizes.textButtonHeight,
    this.textStyle = defaultTextStyle,
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
                Radius.circular(FediSizes.textButtonRadiusCircle)),
            border: Border.all(
              color: FediColors.white,
              width: borderWidth,
            ),
          ),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(FediSizes.textButtonRadiusCircle),
            child: BackdropFilter(
              child: Center(
                child: Padding(
                  padding: FediPadding.buttonHorizontalPadding,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: textStyle.copyWith(
                      color: textStyle.color.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            ),
          )),
    );
  }
}
