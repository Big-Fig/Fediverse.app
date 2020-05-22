import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediFilledEditTextField extends StatelessWidget {
  final String hintText;
  final bool expanded;
  final bool autofocus;
  final TextEditingController textEditingController;
  final Widget leading;

  FediFilledEditTextField({
    @required this.textEditingController,
    @required this.hintText,
    this.leading,
    @required this.expanded,
    @required this.autofocus,
  });

  @override
  Widget build(BuildContext context) {
    var containLeading = leading != null;
    return Container(
      decoration: BoxDecoration(
          color: FediColors.ultraLightGrey,
          borderRadius: BorderRadius.circular(30.0)),
      child: Padding(
        padding: containLeading
            ? const EdgeInsets.all(0.0)
            : const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            if (containLeading) leading,
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontSize: 16.0, color: FediColors.grey, height: 1.5),
                ),
                style: TextStyle(
                    fontSize: 16.0, color: FediColors.darkGrey, height: 1.5),
                autofocus: autofocus,
                controller: textEditingController,
                minLines: null,
                maxLines: null,
                expands: expanded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
