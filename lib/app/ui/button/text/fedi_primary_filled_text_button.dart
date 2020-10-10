import 'dart:ui';

import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediPrimaryFilledTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double borderWidth;
  final bool expanded;
  final Color enabledBackgroundColor;
  final Color disabledBackgroundColor;
  final Color enabledBorderColor;
  final Color disabledBorderColor;

  final TextStyle textStyle;
  static const TextStyle defaultTextStyle = FediTextStyles.mediumShortBoldWhite;

  FediPrimaryFilledTextButton(
    this.text, {
    @required this.onPressed,
    this.enabledBackgroundColor = FediColors.primary,
    this.disabledBackgroundColor = FediColors.lightGrey,
    this.enabledBorderColor = FediColors.white,
    this.disabledBorderColor = FediColors.white,
    this.height = FediSizes.textButtonHeight,
    this.textStyle = defaultTextStyle,
    this.borderWidth = 1,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    var calculatedHeight = height + borderWidth * 2;
    var borderRadius = BorderRadius.all(Radius.circular(calculatedHeight / 2));

    var button = InkWell(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 120,
        ),
        child: Container(
            height: calculatedHeight,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: onPressed != null
                  ? enabledBackgroundColor
                  : disabledBackgroundColor,
              borderRadius: borderRadius,
              border: Border.all(
                color: onPressed != null
                    ? enabledBorderColor
                    : disabledBorderColor,
                width: borderWidth,
              ),
            ),
            child: Padding(
              padding: FediPadding.buttonHorizontalPadding,
              child: Center(
                child: Text(
                  text, textAlign: TextAlign.center, // 80% transparency
                  style: textStyle,
                ),
              ),
            )),
      ),
    );

    if (expanded) {
      return button;
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [button],
      );
    }
  }
}
