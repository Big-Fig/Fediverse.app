import 'dart:ui';

import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediTransparentTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final double width;
  final double height;

  final double borderWidth;

  final TextStyle textStyle;

  final Color color;

  static const TextStyle defaultTextStyle =
      FediTextStyles.mediumShortBoldMediumGrey;

  FediTransparentTextButton(
    this.text, {
    @required this.onPressed,
    this.width,
    this.height = FediSizes.textButtonHeight,
    this.textStyle = defaultTextStyle,
    this.borderWidth = 1,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    var calculatedHeight = height + borderWidth * 2;
    var borderRadius = BorderRadius.all(Radius.circular(calculatedHeight / 2));
    return InkWell(
      onTap: onPressed,
      child: Container(
          width: width,
          height: calculatedHeight,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: borderRadius,
            border: Border.all(
              color: color,
              width: borderWidth,
            ),
          ),
          child: Center(
            child: Padding(
              padding: FediPadding.buttonHorizontalPadding,
              child: Text(
                text,
                style: textStyle.copyWith(color: color),
              ),
            ),
          )),
    );
  }
}
