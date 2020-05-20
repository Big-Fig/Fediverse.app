import 'dart:ui';

import 'package:fedi/app/ui/button/icon/fedi_icon_in_circle_button.dart';
import 'package:fedi/app/ui/button/text/fedi_text_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FediTransparentTextButton extends  StatelessWidget implements FediTextButton {
  final String text;
  final VoidCallback onPressed;
  final double height;

  const FediTransparentTextButton(this.text, {@required this.onPressed, this
      .height =  FediIconInCircleButton.defaultCircleSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: FediColors.darkGrey.withOpacity(0.3),
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: FediColors.white.withOpacity(0.8)),
                  ),
                ),
              ),
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            ),
          )),
    );
  }
}
