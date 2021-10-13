import 'package:fedi/form/field/value/string/validation/string_value_form_field_validation.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class EmailStringValueFormFieldValidationError
    extends StringValueFormFieldValidationError {
  static final emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_text_email_error_invalid_desc;

  static FormValueFieldValidation<String> createValidator() =>
      (String? currentValue) {
        var emailValid = emailRegex.hasMatch(currentValue ?? '');
        if (emailValid) {
          return null;
        } else {
          return EmailStringValueFormFieldValidationError();
        }
      };
}
