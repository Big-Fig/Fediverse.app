import 'dart:ui';

import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/spacer/fedi_medium_horizontal_spacer.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediTransparentIconTextButtonWithBorder extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double borderWidth;
  final IconData icon;

  final TextStyle? textStyle;

  const FediTransparentIconTextButtonWithBorder(
    this.text,
    this.icon, {
    required this.onPressed,
    this.height = FediSizes.textButtonHeight,
    this.borderWidth = 1,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    var calculatedHeight = height + borderWidth * 2;

    var textStyle = this.textStyle ?? IFediUiTextTheme.of(context).bigTallWhite;

    var borderRadius = BorderRadius.all(Radius.circular(calculatedHeight / 2));
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: calculatedHeight,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: IFediUiColorTheme.of(context).darkGrey.withOpacity(0.3),
                borderRadius: borderRadius,
                border: Border.all(
                  color: IFediUiColorTheme.of(context).white,
                  width: borderWidth,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: FediPadding.buttonHorizontalPadding,
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: IFediUiColorTheme.of(context).white,
                        size: 18.0,
                      ),
                      FediMediumHorizontalSpacer(),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: textStyle.copyWith(
                          color: textStyle.color!.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
