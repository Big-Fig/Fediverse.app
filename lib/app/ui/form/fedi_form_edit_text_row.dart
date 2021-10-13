import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/form/fedi_form_column_label.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:flutter/cupertino.dart';

class FediFormEditTextRow extends StatelessWidget {
  final String? label;
  final String hint;
  final bool autocorrect;
  final bool obscureText;
  final String? errorText;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final int? maxLength;
  final bool? enabled;
  final int maxLines;
  final TextInputType? keyboardType;
  final Axis axis;

  const FediFormEditTextRow({
    required this.label,
    required this.autocorrect,
    this.obscureText = false,
    required this.hint,
    required this.errorText,
    required this.textEditingController,
    required this.textInputAction,
    required this.onSubmitted,
    required this.focusNode,
    required this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
    this.keyboardType,
    this.axis = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    var textFieldWidget = FediTransparentEditTextField(
      keyboardType: keyboardType,
      enabled: enabled,
      focusNode: focusNode,
      autocorrect: autocorrect,
      expanded: false,
      autofocus: false,
      hintText: hint,
      maxLines: maxLines,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      textInputAction: textInputAction,
      textEditingController: textEditingController,
      displayUnderlineBorder: true,
      errorText: errorText,
      highlightMentions: false,
      maxLength: maxLength,
    );

    Widget child;
    if (axis == Axis.vertical) {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) FediFormColumnLabel(label),
          textFieldWidget,
        ],
      );
    } else {
      child = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (label != null) FediFormColumnLabel(label),
          Flexible(
            child: textFieldWidget,
          ),
        ],
      );
    }

    return FediFormRow(
      child: child,
    );
  }
}
