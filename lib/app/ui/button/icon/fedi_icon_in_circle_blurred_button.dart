import 'dart:ui';

import 'package:fedi/app/ui/button/icon/fedi_icon_button.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class FediIconInCircleBlurredButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final double iconSize;
  final double borderWidth;
  final double size;

  const FediIconInCircleBlurredButton(
    this.iconData, {
    required this.onPressed,
    this.borderWidth = 1.0,
    this.iconSize = FediSizes.iconInCircleDefaultIconSize,
    this.size = FediSizes.iconInCircleDefaultSize,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        // ignore: no-magic-number
        width: size + borderWidth * 2,
        // ignore: no-magic-number, no-equal-arguments
        height: size + borderWidth * 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size),
          child: BackdropFilter(
            // ignore: no-magic-number
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // ignore: no-magic-number
                color: IFediUiColorTheme.of(context).darkGrey.withOpacity(0.3),
                border: Border.all(
                  color: IFediUiColorTheme.of(context).white,
                  width: borderWidth,
                ),
              ),
              child: FediIconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  iconData,
                  size: iconSize,
                  color: IFediUiColorTheme.of(context).white,
                ),
                onPressed: onPressed,
              ),
            ),
          ),
        ),
      );
}
