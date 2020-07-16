import 'dart:ui';

import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediWhiteFilledTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final double height;

  final double borderWidth;

  final TextStyle textStyle;
  static const TextStyle defaultTextStyle = FediTextStyles.mediumShortBoldGrey;

  FediWhiteFilledTextButton(
    this.text, {
    @required this.onPressed,
    this.height = FediSizes.textButtonHeight,
    this.textStyle = defaultTextStyle,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {

    var calculatedHeight = height + borderWidth * 2;
    var borderRadius = BorderRadius.all(Radius.circular(calculatedHeight / 2));
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: calculatedHeight,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: FediColors.white,
            borderRadius: borderRadius,
            border: Border.all(
              color: FediColors.mediumGrey,
              width: borderWidth,
            ),
          ),
          child: Center(
            child: Padding(
              padding: FediPadding.buttonHorizontalPadding,
              child: Text(
                text,
                style: defaultTextStyle,
              ),
            ),
          )),
    );
  }
}
