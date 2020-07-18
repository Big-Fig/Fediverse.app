import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediTransparentEditTextField extends StatelessWidget {
  final bool expanded;
  final bool autofocus;
  final TextEditingController textEditingController;
  final String hintText;
  final String errorText;
  final FocusNode focusNode;
  final int maxLines;
  final ValueChanged<String> onSubmitted;
  final TextInputAction textInputAction;
  final bool displayUnderlineBorder;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType keyboardType;

  final InputBorder border;
  final InputBorder focusedBorder;
  final InputBorder errorBorder;

  final TextStyle hintStyle;
  final TextStyle textStyle;

  FediTransparentEditTextField({
    @required this.expanded,
    @required this.autofocus,
    @required this.hintText,
    @required this.errorText,
    @required this.maxLines,
    @required this.onSubmitted,
    @required this.textInputAction,
    @required this.textEditingController,
    this.displayUnderlineBorder = false,
    @required this.focusNode,
    this.hintStyle = FediTextStyles.subHeaderTallLightGrey,
    this.textStyle = FediTextStyles.subHeaderTallDarkGrey,
    @required this.keyboardType,
    Color customBorderColor,
    this.autocorrect = true,
    this.obscureText = false,
  })  : border = UnderlineInputBorder(
          borderSide: BorderSide(
              width: 1.0, color: customBorderColor ?? FediColors.lightGrey),
        ),
        focusedBorder = UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: customBorderColor ?? FediColors.primaryColor,
          ),
        ),
        errorBorder = UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: FediColors.error,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: autocorrect,
      focusNode: focusNode,
      textInputAction:
          maxLines == 1 ? textInputAction : TextInputAction.newline,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: displayUnderlineBorder ? border : InputBorder.none,
        enabledBorder: displayUnderlineBorder ? border : InputBorder.none,
        focusedBorder:
            displayUnderlineBorder ? focusedBorder : InputBorder.none,
        errorBorder: displayUnderlineBorder ? errorBorder : InputBorder.none,
        focusedErrorBorder:
            displayUnderlineBorder ? errorBorder : InputBorder.none,
        errorStyle: FediTextStyles.mediumShortDarkGrey.copyWith(
          color: FediColors.error,
        ),
        errorText: errorText,
        hintText: hintText,
        hintStyle: hintStyle,
      ),
      style: textStyle,
      obscureText: obscureText,
      autofocus: autofocus,
      controller: textEditingController,
      minLines: null,
      maxLines: maxLines,
      expands: expanded,
      keyboardType: keyboardType,
    );
  }
}
