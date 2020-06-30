import 'package:fedi/app/ui/fedi_colors.dart';
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
  final FocusNode focusNode;
  final int maxLines;
  final ValueChanged<String> onSubmitted;
  final TextInputAction textInputAction;
  final bool displayUnderlineBorder;
  final bool autocorrect;

  FediTransparentEditTextField({
    @required this.expanded,
    @required this.autofocus,
    @required this.hintText,
    @required this.maxLines,
    @required this.onSubmitted,
    @required this.textInputAction,
    @required this.textEditingController,
    this.displayUnderlineBorder = false,
    this.focusNode,
    this.autocorrect = true,
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
          focusedBorder:  displayUnderlineBorder ? _focusedBorder :  InputBorder.none,
          errorBorder:  displayUnderlineBorder ? _errorBorder :  InputBorder.none,
          focusedErrorBorder:  displayUnderlineBorder ? _errorBorder :  InputBorder.none,
          errorStyle: TextStyle(
            fontSize: 14.0,
            color: FediColors.error,
            height: 1.15,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 18.0,
            color: FediColors.lightGrey,
            height: 1.5,
          )),
      style: TextStyle(
        fontSize: 18.0,
        color: FediColors.darkGrey,
        height: 1.5,
      ),
      autofocus: autofocus,
      controller: textEditingController,
      minLines: null,
      maxLines: maxLines,
      expands: expanded,
    );
  }
}
