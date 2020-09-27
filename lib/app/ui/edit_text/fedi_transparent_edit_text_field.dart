import 'package:fedi/app/ui/edit_text/fedi_base_edit_text_field.dart';
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
  final bool highlightMentions;
  final int maxLength;
  final bool enabled;

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
    this.keyboardType,
    Color customBorderColor,
    this.autocorrect = true,
    this.obscureText = false,
    @required this.highlightMentions,
    @required this.maxLength,
    this.enabled = true,
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
  Widget build(BuildContext context) => FediBaseEditTextField(
        enabled: enabled,
        highlightMentions: highlightMentions,
        autocorrect: autocorrect,
        focusNode: focusNode,
        textInputAction:
            maxLines == 1 ? textInputAction : TextInputAction.newline,
        onSubmitted: onSubmitted,
        textStyle: textStyle,
        obscureText: obscureText,
        autofocus: autofocus,
        textEditingController: textEditingController,
        minLines: null,
        maxLines: maxLines,
        expanded: expanded,
        keyboardType: keyboardType,
        hintText: hintText,
        errorText: errorText,
        border: border,
        errorBorder: errorBorder,
        focusedBorder: focusedBorder,
        contentPadding: null,
        displayBorder: displayUnderlineBorder,
        hintStyle: hintStyle,
        maxLength: maxLength,
      );
}
