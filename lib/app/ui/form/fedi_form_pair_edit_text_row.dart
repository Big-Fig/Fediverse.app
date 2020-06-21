import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/form/fedi_form_edit_text_label.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:flutter/cupertino.dart';

class FediFormPairEditTextRow extends StatelessWidget {
  final String label;
  final String nameHint;
  final TextEditingController nameTextEditingController;
  final TextEditingController valueTextEditingController;
  final String valueHint;

  FediFormPairEditTextRow({
    @required this.label,
    @required this.nameHint,
    @required this.valueHint,
    @required this.nameTextEditingController,
    @required this.valueTextEditingController,
  });

  @override
  Widget build(BuildContext context) => FediFormRow(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FediFormEditTextLabel(label),
            Row(
              children: [
                Expanded(
                  child: FediTransparentEditTextField(
                    expanded: false,
                    autofocus: false,
                    hintText: nameHint,
                    maxLines: 1,
                    onSubmitted: null,
                    textInputAction: TextInputAction.done,
                    textEditingController: nameTextEditingController,
                    displayUnderlineBorder: true,
                  ),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: FediTransparentEditTextField(
                    expanded: false,
                    autofocus: false,
                    hintText: valueHint,
                    maxLines: 1,
                    onSubmitted: null,
                    textInputAction: TextInputAction.done,
                    textEditingController: valueTextEditingController,
                    displayUnderlineBorder: true,
                  ),
                ),
              ],
            ),

          ],
        ),
      );
}
