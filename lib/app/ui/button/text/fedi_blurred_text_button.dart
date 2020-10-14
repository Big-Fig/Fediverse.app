import 'dart:ui';

import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediBlurredTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double borderWidth;

  final bool limitMinWidth;

  final TextStyle textStyle;
  static const TextStyle defaultTextStyle = FediTextStyles.mediumShortBoldWhite;

  const FediBlurredTextButton(
    this.text, {
    @required this.onPressed,
    this.height = FediSizes.textButtonHeight,
    this.textStyle = defaultTextStyle,
    this.borderWidth = 1,
    this.limitMinWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    var calculatedHeight = height + borderWidth * 2;
    var borderRadius = BorderRadius.all(Radius.circular(calculatedHeight / 2));
    return InkWell(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: limitMinWidth == true ? 120.0 : 0.0,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: BackdropFilter(
            child: Container(
              height: calculatedHeight,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: FediColors.darkGrey.withOpacity(0.3),
                borderRadius: borderRadius,
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
                    textAlign: TextAlign.center,
                    style: textStyle.copyWith(
                      color: textStyle.color.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          ),
        ),
      ),
    );
  }
}
