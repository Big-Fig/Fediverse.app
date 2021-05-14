import 'dart:ui';

import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediPrimaryFilledTextButtonWithBorder extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double borderWidth;
  final bool expanded;
  final Color? enabledBackgroundColor;
  final Color? disabledBackgroundColor;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;

  final bool limitMinWidth;

  final TextStyle? textStyle;

  FediPrimaryFilledTextButtonWithBorder(
    this.text, {
    required this.onPressed,
    this.enabledBackgroundColor,
    this.disabledBackgroundColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.height = FediSizes.textButtonHeight,
    this.textStyle,
    this.borderWidth = 1,
    required this.expanded,
    this.limitMinWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle =
        this.textStyle ?? IFediUiTextTheme.of(context).mediumShortBoldWhite;

    var enabledBackgroundColor =
        this.enabledBackgroundColor ?? IFediUiColorTheme.of(context).primary;
    var disabledBackgroundColor =
        this.disabledBackgroundColor ?? IFediUiColorTheme.of(context).lightGrey;
    var enabledBorderColor =
        this.enabledBorderColor ?? IFediUiColorTheme.of(context).white;
    var disabledBorderColor =
        this.disabledBorderColor ?? IFediUiColorTheme.of(context).white;

    // ignore: no-magic-number
    var calculatedHeight = height + borderWidth * 2;
    // ignore: no-magic-number
    var borderRadius = BorderRadius.all(Radius.circular(calculatedHeight / 2));

    // todo: copy-pasted code

    var button = InkWell(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          // ignore: no-magic-number
          minWidth: limitMinWidth ? 120.0 : 0.0,
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
              color:
                  onPressed != null ? enabledBorderColor : disabledBorderColor,
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
          ),
        ),
      ),
    );

    if (expanded) {
      return button;
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          button,
        ],
      );
    }
  }
}
