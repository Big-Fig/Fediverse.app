import 'package:fedi/app/ui/edit_text/fedi_base_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediFilledEditTextField extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final bool expanded;
  final bool autofocus;
  final TextEditingController textEditingController;
  final Widget? leading;
  final Widget? ending;
  final FocusNode? focusNode;
  final int? maxLines;
  final ValueChanged<String> onSubmitted;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final BoxBorder? border;
  final Color? backgroundColor;
  final bool highlightMentions;
  final int? maxLength;

  // todo: refactor to own widget
  final bool filled;

  FediFilledEditTextField({
    required this.textEditingController,
    required this.hintText,
    required this.errorText,
    required this.maxLines,
    required this.onSubmitted,
    required this.textInputAction,
    this.leading,
    this.border,
    this.backgroundColor,
    this.ending,
    required this.expanded,
    required this.autofocus,
    this.focusNode,
    this.autocorrect = true,
    this.keyboardType,
    required this.highlightMentions,
    required this.maxLength,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        this.backgroundColor ?? IFediUiColorTheme.of(context).ultraLightGrey;
    var containLeading = leading != null;
    var containEnding = ending != null;
    return Container(
      decoration: filled
          ? BoxDecoration(
              color: backgroundColor,
              border: border,
              borderRadius: BorderRadius.circular(30.0),
            )
          : null,
      child: Padding(
        padding: calculatePadding(containLeading, containEnding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (containLeading) leading!,
            Flexible(
              child: FediBaseEditTextField(
                highlightMentions: highlightMentions,
                autocorrect: autocorrect,
                focusNode: focusNode,
                maxLength: maxLength,
                textInputAction:
                    maxLines == 1 ? textInputAction : TextInputAction.newline,
                onSubmitted: onSubmitted,
                autofocus: autofocus,
                textEditingController: textEditingController,
                maxLines: maxLines,
                expanded: expanded,
                keyboardType: keyboardType,
                hintText: hintText,
                errorText: errorText,
                textStyle: IFediUiTextTheme.of(context).bigTallDarkGrey,
                minLines: null,
                hintStyle: IFediUiTextTheme.of(context).bigTallGrey,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                displayBorder: false,
              ),
            ),
            if (containEnding) ending!,
          ],
        ),
      ),
    );
  }

  EdgeInsets calculatePadding(bool containLeading, bool containEnding) {
    if (containLeading && containEnding) {
      return EdgeInsets.zero;
    } else {
      if (!containLeading && !containEnding) {
        return FediPadding.horizontalBigPadding;
      } else {
        if (containLeading) {
          return const EdgeInsets.only(right: FediSizes.bigPadding);
        } else {
          return const EdgeInsets.only(left: FediSizes.bigPadding);
        }
      }
    }
  }
}
