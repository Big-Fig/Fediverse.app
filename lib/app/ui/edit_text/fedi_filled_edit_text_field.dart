import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/app/ui/fedi_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fedi_padding.dart';

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

  FediFilledEditTextField({
    @required this.textEditingController,
    @required this.hintText,
    @required this.errorText,
    @required this.maxLines,
    @required this.onSubmitted,
    @required this.textInputAction,
    this.leading,
    this.ending,
    @required this.expanded,
    @required this.autofocus,
    this.focusNode,
    this.autocorrect = true,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    var containLeading = leading != null;
    var containEnding = ending != null;
    return Container(
      decoration: BoxDecoration(
          color: FediColors.ultraLightGrey,
          borderRadius: BorderRadius.circular(30.0)),
      child: Padding(
        padding: calculatePadding(containLeading, containEnding),
        child: Row(
          children: [
            if (containLeading) leading,
            Flexible(
              child: TextField(
                autocorrect:autocorrect,
                focusNode: focusNode,
                textInputAction:
                    maxLines == 1 ? textInputAction : TextInputAction.newline,
                onSubmitted: onSubmitted,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  errorText: errorText,
                  hintStyle:FediTextStyles.bigTallGrey,
                ),
                style:FediTextStyles.bigTallDarkGrey,
                autofocus: autofocus,
                controller: textEditingController,
                minLines: null,
                maxLines: maxLines,
                expands: expanded,
                keyboardType: keyboardType,
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
