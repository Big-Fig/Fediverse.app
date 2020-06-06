import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediTransparentEditTextField extends StatelessWidget {
  final bool expanded;
  final bool autofocus;
  final TextEditingController textEditingController;
  final String hintText;
  final FocusNode focusNode;
  final int maxLines;
  final ValueChanged<String> onSubmitted;
  final TextInputAction textInputAction;

  FediTransparentEditTextField({
    @required this.expanded,
    @required this.autofocus,
    @required this.hintText,
    @required this.maxLines,
    @required this.onSubmitted,
    @required this.textInputAction,
    @required this.textEditingController,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      textInputAction:
          maxLines == 1 ? textInputAction : TextInputAction.newline,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          border: InputBorder.none,
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
