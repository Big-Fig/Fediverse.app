import 'package:fedi/app/ui/edit_text/fedi_transparent_edit_text_field.dart';
import 'package:fedi/app/ui/form/fedi_form_edit_text_label.dart';
import 'package:fedi/app/ui/form/fedi_form_row.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/form_item_validation.dart';
import 'package:flutter/cupertino.dart';

class FediFormEditTextRow extends StatelessWidget {
  final String label;
  final String hint;
  final bool autocorrect;
  final IFormStringFieldBloc formStringFieldBloc;

  FediFormEditTextRow({
    @required this.label,
    @required this.autocorrect,
    @required this.hint,
    @required this.formStringFieldBloc,
  });

  @override
  Widget build(BuildContext context) => FediFormRow(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FediFormEditTextLabel(label),
            StreamBuilder<List<FormItemValidationError>>(
                stream: formStringFieldBloc.errorsStream,
                initialData: formStringFieldBloc.errors,
                builder: (context, snapshot) {
                  var errors = snapshot.data;

                  var error = errors?.isNotEmpty == true ? errors.first : null;

                  return FediTransparentEditTextField(
                    autocorrect: autocorrect,
                    expanded: false,
                    autofocus: false,
                    hintText: hint,
                    maxLines: 1,
                    onSubmitted: null,
                    textInputAction: TextInputAction.done,
                    textEditingController:
                        formStringFieldBloc.textEditingController,
                    displayUnderlineBorder: true,
                    errorText: error?.createErrorDescription(context),
                  );
                }),
          ],
        ),
      );
}
