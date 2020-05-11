import 'dart:ui';

import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/refactored/app/ui/button/text/fedi_text_button.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediTransparentTextButton extends FediTextButton {
  final String text;
  final VoidCallback onPressed;

  FediTransparentTextButton(this.text, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: FediIconInCircleButton.defaultCircleSize,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: FediColors.darkGrey.withAlpha((0.3 * 255).toInt()),
            borderRadius: BorderRadius.all(
                Radius.circular(FediIconInCircleButton.defaultCircleSize)),
            border: Border.all(
              color: FediColors.white,
              width: 1.0,
            ),
          ),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(FediIconInCircleButton.defaultCircleSize),
            child: BackdropFilter(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  child: Text(
                    text,
                    // 80% transparency
                    style: TextStyle(
                        fontSize: 16.0,

                        color: FediColors.white.withAlpha((0.8 * 255).toInt())),
                  ),
                ),
              ),
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            ),
          )),
    );
  }
}
