import 'package:fedi/app/ui/edit_text/fedi_base_edit_text_field.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediFilledEditTextField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final bool expanded;
  final bool autofocus;
  final TextEditingController textEditingController;
  final Widget leading;
  final Widget ending;
  final FocusNode focusNode;
  final int maxLines;
  final ValueChanged<String> onSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool autocorrect;
  final BoxBorder border;
  final Color backgroundColor;
  final bool highlightMentions;

  FediFilledEditTextField({
    @required this.textEditingController,
    @required this.hintText,
    @required this.errorText,
    @required this.maxLines,
    @required this.onSubmitted,
    @required this.textInputAction,
    this.leading,
    this.border,
    this.backgroundColor = FediColors.ultraLightGrey,
    this.ending,
    @required this.expanded,
    @required this.autofocus,
    this.focusNode,
    this.autocorrect = true,
    this.keyboardType,
    @required this.highlightMentions,
  });

  @override
  Widget build(BuildContext context) {
    var containLeading = leading != null;
    var containEnding = ending != null;
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: BorderRadius.circular(30.0)),
      child: Padding(
        padding: calculatePadding(containLeading, containEnding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (containLeading) leading,
            Flexible(
              child: FediBaseEditTextField(
                highlightMentions: highlightMentions,
                autocorrect: autocorrect,
                focusNode: focusNode,
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
                textStyle: FediTextStyles.bigTallDarkGrey,
                minLines: null,
                hintStyle: FediTextStyles.bigTallGrey,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                displayBorder: false,
              ),
            ),
            if (containEnding) ending,
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
