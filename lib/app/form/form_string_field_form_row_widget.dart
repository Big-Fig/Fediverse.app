import 'package:fedi/app/ui/form/fedi_form_edit_text_row.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/form_item_validation.dart';
import 'package:flutter/cupertino.dart';

class FormStringFieldFormRowWidget extends StatelessWidget {
  final String label;
  final String hint;
  final bool autocorrect;
  final bool obscureText;
  final IFormStringFieldBloc formStringFieldBloc;
  final ValueChanged<String> onSubmitted;
  final TextInputAction textInputAction;

  FormStringFieldFormRowWidget({
    @required this.label,
    @required this.autocorrect,
    this.obscureText = false,
    @required this.hint,
    @required this.formStringFieldBloc,
    @required this.onSubmitted,
    @required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FormItemValidationError>>(
        stream: formStringFieldBloc.errorsStream,
        initialData: formStringFieldBloc.errors,
        builder: (context, snapshot) {
          var errors = snapshot.data;

          var error = errors?.isNotEmpty == true ? errors.first : null;

          return FediFormEditTextRow(
            hint: hint,
            label: label,
            autocorrect: autocorrect,
            obscureText: obscureText,
            textEditingController: formStringFieldBloc.textEditingController,
            errorText: error?.createErrorDescription(context),
            onSubmitted: onSubmitted,
            textInputAction: textInputAction,
            focusNode: formStringFieldBloc.focusNode,
          );
        });
  }
}
