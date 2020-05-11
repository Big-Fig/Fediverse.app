import 'dart:ui';

import 'package:fedi/refactored/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/refactored/app/ui/button/text/fedi_text_button.dart';
import 'package:fedi/refactored/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediFilledTextButton extends FediTextButton {
  final String text;
  final VoidCallback onPressed;

  FediFilledTextButton(this.text, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: FediIconInCircleButton.defaultCircleSize,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: FediColors.primaryColor,
            borderRadius: BorderRadius.all(
                Radius.circular(FediIconInCircleButton.defaultCircleSize)),
            border: Border.all(
              color: FediColors.white,
              width: 1.0,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              child: Text(
                text,
                // 80% transparency
                style: TextStyle(
                    fontFamily: "Rubik",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: FediColors.white),
              ),
            ),
          )),
    );
  }
}
