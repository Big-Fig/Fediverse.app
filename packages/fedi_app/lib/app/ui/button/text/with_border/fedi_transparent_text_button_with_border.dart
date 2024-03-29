import 'dart:ui';

import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/fedi_sizes.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class FediTransparentTextButtonWithBorder extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  final double? width;
  final double height;

  final double borderWidth;

  final TextStyle? textStyle;

  final Color color;

  final bool expanded;

  final bool limitMinWidth;
  final bool borderVisible;

  const FediTransparentTextButtonWithBorder(
    this.text, {
    Key? key,
    required this.onPressed,
    this.width,
    this.height = FediSizes.textButtonHeight,
    this.textStyle,
    this.borderWidth = 1,
    required this.color,
    required this.expanded,
    this.borderVisible = true,
    this.limitMinWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = this.textStyle ??
        IFediUiTextTheme.of(context).mediumShortBoldMediumGrey;
    // todo: copy-pasted code
    // ignore: no-magic-number
    var calculatedHeight = height + borderWidth * 2;
    // ignore: no-magic-number
    var borderRadius = BorderRadius.all(Radius.circular(calculatedHeight / 2));
    var button = InkWell(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          // ignore: no-magic-number
          minWidth: limitMinWidth ? 120.0 : 0.0,
        ),
        child: Container(
          width: width,
          height: calculatedHeight,
          decoration: borderVisible
              ? BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: borderRadius,
                  border: Border.all(
                    color: color,
                    width: borderWidth,
                  ),
                )
              : null,
          child: Center(
            child: Padding(
              padding: FediPadding.buttonHorizontalPadding,
              child: Text(
                text!,
                textAlign: TextAlign.center,
                style: textStyle.copyWith(
                  color: color,
                ),
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
        children: [button],
      );
    }
  }
}
