import 'package:fedi/app/ui/edit_text/fedi_base_edit_text_field.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediTransparentEditTextField extends StatelessWidget {
  final bool expanded;
  final bool autofocus;
  final TextEditingController textEditingController;
  final String hintText;
  final String? errorText;
  final FocusNode? focusNode;
  final int? maxLines;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;
  final bool displayUnderlineBorder;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType? keyboardType;

  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;

  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool highlightMentions;
  final int? maxLength;
  final bool? enabled;

  final Color? customBorderColor;

  FediTransparentEditTextField({
    Key? key,
    required this.expanded,
    required this.autofocus,
    required this.hintText,
    required this.errorText,
    required this.maxLines,
    required this.onSubmitted,
    required this.textInputAction,
    required this.textEditingController,
    this.displayUnderlineBorder = false,
    required this.focusNode,
    this.hintStyle,
    this.textStyle,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.keyboardType,
    this.customBorderColor,
    this.autocorrect = true,
    this.obscureText = false,
    required this.highlightMentions,
    required this.maxLength,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hintStyle =
        this.hintStyle ?? IFediUiTextTheme.of(context).subHeaderTallLightGrey;
    var textStyle =
        this.textStyle ?? IFediUiTextTheme.of(context).subHeaderTallDarkGrey;

    var border = this.border ??
        UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: customBorderColor ?? IFediUiColorTheme.of(context).lightGrey,
          ),
        );
    var focusedBorder = this.focusedBorder ??
        UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: customBorderColor ?? IFediUiColorTheme.of(context).primary,
          ),
        );
    var errorBorder = this.errorBorder ??
        UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: IFediUiColorTheme.of(context).error,
          ),
        );

    return FediBaseEditTextField(
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
}
