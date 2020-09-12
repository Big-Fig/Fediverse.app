import 'package:extended_text_field/extended_text_field.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FediBaseEditTextField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final bool expanded;
  final bool autofocus;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final int minLines;
  final int maxLines;
  final ValueChanged<String> onSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool autocorrect;
  final bool obscureText;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final EdgeInsets contentPadding;
  final bool displayBorder;
  final InputBorder border;
  final InputBorder focusedBorder;
  final InputBorder errorBorder;
  final bool highlightMentions;
  final int maxLength;

  FediBaseEditTextField({
    @required this.textEditingController,
    @required this.hintText,
    @required this.errorText,
    @required this.maxLines,
    @required this.minLines,
    @required this.onSubmitted,
    @required this.textInputAction,
    @required this.expanded,
    @required this.autofocus,
    @required this.focusNode,
    this.autocorrect = true,
    this.obscureText = false,
    @required this.keyboardType,
    @required this.textStyle,
    @required this.hintStyle,
    @required this.contentPadding,
    @required this.displayBorder,
    @required this.border,
    @required this.errorBorder,
    @required this.focusedBorder,
    @required this.highlightMentions,
    @required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return ExtendedTextField(
      specialTextSpanBuilder: _SpecialTextSpanBuilder(),
//    return TextField(
      maxLength: maxLength,
      autocorrect: autocorrect,
      obscureText: obscureText,
      focusNode: focusNode,
      textInputAction:
          maxLines == 1 ? textInputAction : TextInputAction.newline,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        border: displayBorder ? border : InputBorder.none,
        enabledBorder: displayBorder ? border : InputBorder.none,
        focusedBorder: displayBorder ? focusedBorder : InputBorder.none,
        errorBorder: displayBorder ? errorBorder : InputBorder.none,
        focusedErrorBorder: displayBorder ? errorBorder : InputBorder.none,
        errorStyle: textStyle.copyWith(
          color: FediColors.error,
        ),
        hintText: hintText,
        errorText: errorText,
        contentPadding: contentPadding,
        hintStyle: hintStyle,
      ),
      style: textStyle,
      autofocus: autofocus,
      controller: textEditingController,
      minLines: minLines,
      maxLines: maxLines,
      expands: expanded,
      keyboardType: keyboardType,
      buildCounter: (BuildContext context,
              {int currentLength, int maxLength, bool isFocused}) =>
          null,
    );
  }
}

class _MentionSpecialText extends SpecialText {
  static const String flag = "@";
  final int start;

  _MentionSpecialText({
    @required TextStyle textStyle,
    @required SpecialTextGestureTapCallback onTap,
    @required this.start,
  }) : super(
          flag,
          " ",
          textStyle,
        );

  @override
  InlineSpan finishText() {
    final String mentionText = toString();

    return SpecialTextSpan(
      text: mentionText,
      actualText: mentionText,
      start: start,
      style: textStyle,
      recognizer: (TapGestureRecognizer()
        ..onTap = () {
          if (onTap != null) onTap(mentionText);
        }),
    );
  }
}

class _SpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  @override
  SpecialText createSpecialText(String flag,
      {TextStyle textStyle, SpecialTextGestureTapCallback onTap, int index}) {
    ///index is end index of start flag, so text start index should be index-(flag.length-1)
    if (flag?.isNotEmpty == true && isStart(flag, _MentionSpecialText.flag)) {
      return _MentionSpecialText(
        textStyle: textStyle?.copyWith(color: FediColors.primaryColor),
        onTap: onTap,
        start: index - (_MentionSpecialText.flag.length - 1),
      );
    } else {
      return null;
    }
  }
}
