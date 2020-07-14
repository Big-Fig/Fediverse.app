import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var _border = UnderlineInputBorder(
  borderSide: BorderSide(width: 1.0, color: FediColors.lightGrey),
);
var _focusedBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    width: 1.0,
    color: FediColors.primaryColor,
  ),
);
var _errorBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    width: 1.0,
    color: FediColors.error,
  ),
);

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
    this.autocorrect = true,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: autocorrect,
      focusNode: focusNode,
      textInputAction:
          maxLines == 1 ? textInputAction : TextInputAction.newline,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: displayUnderlineBorder ? _border : InputBorder.none,
        focusedBorder:
            displayUnderlineBorder ? _focusedBorder : InputBorder.none,
        errorBorder: displayUnderlineBorder ? _errorBorder : InputBorder.none,
        focusedErrorBorder:
            displayUnderlineBorder ? _errorBorder : InputBorder.none,
        errorStyle: FediTextStyles.mediumShortDarkGrey.copyWith(
          color: FediColors.error,
        ),
        errorText: errorText,
        hintText: hintText,
        hintStyle: FediTextStyles.subHeaderTallLightGrey,
      ),
      style: FediTextStyles.subHeaderTallDarkGrey,
      obscureText: obscureText,
      autofocus: autofocus,
      controller: textEditingController,
      minLines: null,
      maxLines: maxLines,
      expands: expanded,
    );
  }
}
