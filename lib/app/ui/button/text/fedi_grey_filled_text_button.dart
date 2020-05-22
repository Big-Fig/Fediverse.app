import 'dart:ui';

import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/app/ui/button/text/fedi_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediGreyFilledTextButton extends FediTextButton {
  final String text;
  final VoidCallback onPressed;

  FediGreyFilledTextButton(this.text, {@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: FediIconInCircleButton.defaultCircleSize,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: onPressed != null
                ? FediColors.ultraLightGrey
                : FediColors.lightGrey,
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
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: FediColors.grey),
              ),
            ),
          )),
    );
  }
}
