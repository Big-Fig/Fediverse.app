import 'package:fedi/app/ui/form/fedi_form_edit_text_row.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:flutter/cupertino.dart';

class StringFormFieldRowWidget extends StatelessWidget {
  final String label;
  final String hint;
  final bool autocorrect;
  final bool obscureText;
  final ValueChanged<String> onSubmitted;
  final TextInputAction textInputAction;

  StringFormFieldRowWidget({
    @required this.label,
    @required this.autocorrect,
    this.obscureText = false,
    @required this.hint,
    @required this.onSubmitted,
    @required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    var formFieldBloc = IStringValueFormFieldBloc.of(context);
    return StreamBuilder<List<FormItemValidationError>>(
      stream: formFieldBloc.errorsStream,
      initialData: formFieldBloc.errors,
      builder: (context, snapshot) {
        var errors = snapshot.data;

        var error = errors?.isNotEmpty == true ? errors.first : null;

        return StreamBuilder<bool>(
          stream: formFieldBloc.isEnabledStream,
          initialData: formFieldBloc.isEnabled,
          builder: (context, snapshot) {
            var isEnabled = snapshot.data;
            return FediFormEditTextRow(
              enabled: isEnabled,
              maxLength: formFieldBloc.maxLength,
              hint: hint,
              label: label,
              autocorrect: autocorrect,
              obscureText: obscureText,
              textEditingController: formFieldBloc.textEditingController,
              errorText: error?.createErrorDescription(context),
              onSubmitted: onSubmitted,
              textInputAction: textInputAction,
              focusNode: formFieldBloc.focusNode,
            );
          },
        );
      },
    );
  }
}
