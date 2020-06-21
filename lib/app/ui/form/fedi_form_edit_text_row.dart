import 'package:fedi/app/ui/divider/fedi_light_grey_divider.dart';
import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/form/fedi_form_edit_text_label.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:flutter/cupertino.dart';

class FediFormEditTextRow extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController textEditingController;

  FediFormEditTextRow({
    @required this.label,
    @required this.hint,
    @required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) => FediFormRow(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FediFormEditTextLabel(label),
            FediTransparentEditTextField(
              expanded: false,
              autofocus: false,
              hintText: hint,
              maxLines: 1,
              onSubmitted: null,
              textInputAction: TextInputAction.done,
              textEditingController: textEditingController,
              displayUnderlineBorder: true,
            ),
          ],
        ),
      );
}
