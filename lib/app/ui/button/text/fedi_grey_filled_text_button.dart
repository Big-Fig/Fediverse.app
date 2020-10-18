import 'dart:ui';

import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediGreyFilledTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  final double height;

  final double borderWidth;

  final TextStyle textStyle;

  final bool limitMinWidth;

  FediGreyFilledTextButton(
    this.text, {
    @required this.onPressed,
    this.height = FediSizes.textButtonHeight,
    this.textStyle,
    this.borderWidth = 1,
    this.limitMinWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle =
        this.textStyle ?? IFediUiTextTheme.of(context).mediumShortBoldGrey;
    var calculatedHeight = height + borderWidth * 2;
    var borderRadius = BorderRadius.all(Radius.circular(calculatedHeight / 2));
    return InkWell(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: limitMinWidth == true ? 120.0 : 0.0,
        ),
        child: Container(
            height: calculatedHeight,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: onPressed != null
                  ? IFediUiColorTheme.of(context).ultraLightGrey
                  : IFediUiColorTheme.of(context).lightGrey,
              borderRadius: borderRadius,
              border: Border.all(
                color: IFediUiColorTheme.of(context).white,
                width: borderWidth,
              ),
            ),
            child: Center(
              child: Padding(
                padding: FediPadding.buttonHorizontalPadding,
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            )),
      ),
    );
  }
}
