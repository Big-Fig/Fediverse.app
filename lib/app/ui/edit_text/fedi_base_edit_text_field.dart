import 'package:extended_text_field/extended_text_field.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FediBaseEditTextField extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final bool expanded;
  final bool autofocus;
  final TextEditingController textEditingController;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final bool obscureText;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final EdgeInsets? contentPadding;
  final bool displayBorder;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final bool highlightMentions;
  final int? maxLength;
  final bool? enabled;
  final bool hideCounter;

  FediBaseEditTextField({
    required this.textEditingController,
    required this.hintText,
    required this.errorText,
    required this.maxLines,
    required this.minLines,
    required this.onSubmitted,
    required this.textInputAction,
    required this.expanded,
    required this.autofocus,
    required this.focusNode,
    this.autocorrect = true,
    this.hideCounter = true,
    this.obscureText = false,
    required this.keyboardType,
    required this.textStyle,
    required this.hintStyle,
    required this.contentPadding,
    required this.displayBorder,
    required this.border,
    required this.errorBorder,
    required this.focusedBorder,
    required this.highlightMentions,
    required this.maxLength,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    // return TextField(
    var actualTextInputAction =
        maxLines == 1 ? textInputAction : TextInputAction.newline;
    Widget child;
    if (highlightMentions) {
      child = buildExtendedTextField(context, actualTextInputAction);
    } else {
      child = buildTextField(actualTextInputAction, context);
    }
    return child;
  }

  TextField buildTextField(TextInputAction actualTextInputAction, BuildContext context) {
    return TextField(
      enabled: enabled,
      maxLength: maxLength,
      autocorrect: autocorrect,
      obscureText: obscureText,
      focusNode: focusNode,
      textInputAction: actualTextInputAction,
      onSubmitted: (value) {
        onSubmitted!(value);
      },
      decoration: InputDecoration(
        border: displayBorder ? border : InputBorder.none,
        // ignore: no-equal-arguments
        enabledBorder: displayBorder ? border : InputBorder.none,
        focusedBorder: displayBorder ? focusedBorder : InputBorder.none,
        errorBorder: displayBorder ? errorBorder : InputBorder.none,
        // ignore: no-equal-arguments
        focusedErrorBorder: displayBorder ? errorBorder : InputBorder.none,
        errorStyle: textStyle.copyWith(
          color: IFediUiColorTheme.of(context).error,
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
      buildCounter: (
        BuildContext context, {
        int? currentLength,
        int? maxLength,
        bool? isFocused,
      }) =>
          null,
    );
  }

  ExtendedTextField buildExtendedTextField(BuildContext context, TextInputAction actualTextInputAction) {
    return ExtendedTextField(
      enabled: enabled,
      specialTextSpanBuilder: _SpecialTextSpanBuilder(
        color: IFediUiColorTheme.of(context).primary,
      ),
      maxLength: maxLength,
      autocorrect: autocorrect,
      obscureText: obscureText,
      focusNode: focusNode,
      textInputAction: actualTextInputAction,
      onSubmitted: (value) {
        onSubmitted!(value);
      },
      decoration: InputDecoration(
        border: displayBorder ? border : InputBorder.none,
        // ignore: no-equal-arguments
        enabledBorder: displayBorder ? border : InputBorder.none,
        focusedBorder: displayBorder ? focusedBorder : InputBorder.none,
        errorBorder: displayBorder ? errorBorder : InputBorder.none,
        // ignore: no-equal-arguments
        focusedErrorBorder: displayBorder ? errorBorder : InputBorder.none,
        errorStyle: textStyle.copyWith(
          color: IFediUiColorTheme.of(context).error,
        ),
        counterText: hideCounter ? "" : null,
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
      buildCounter: null,
    );
  }
}

class _MentionSpecialText extends SpecialText {
  static const String flag = "@";
  final int start;

  _MentionSpecialText({
    required TextStyle textStyle,
    required SpecialTextGestureTapCallback? onTap,
    required this.start,
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
      // ignore: no-equal-arguments
      actualText: mentionText,
      start: start,
      style: textStyle,
      recognizer: (TapGestureRecognizer()
        ..onTap = () {
          if (onTap != null) onTap!(mentionText);
        }),
    );
  }
}

class _SpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  final Color color;

  _SpecialTextSpanBuilder({
    required this.color,
  });

  @override
  SpecialText? createSpecialText(
    String flag, {
    TextStyle? textStyle,
    SpecialTextGestureTapCallback? onTap,
    required int index,
  }) {
    // index is end index of start flag, so text start index should be index-(flag.length-1)
    if (flag.isNotEmpty && isStart(flag, _MentionSpecialText.flag)) {
      return _MentionSpecialText(
        // todo: why !
        textStyle: textStyle!.copyWith(
          color: color,
        ),
        onTap: onTap,
        start: index - (_MentionSpecialText.flag.length - 1),
      );
    } else {
      return null;
    }
  }
}
