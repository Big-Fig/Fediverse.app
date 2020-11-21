import 'package:fedi/generated/l10n.dart';
import 'package:fedi/form/field/value/string/form_string_field_validation.dart';
import 'package:fedi/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

class FormEmailStringFieldValidationError extends FormStringFieldValidationError {
  static final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_text_email_error_invalid_desc;

  static FormValueFieldValidation createValidator() => (currentValue) {
    bool emailValid = emailRegex.hasMatch(currentValue ?? "");
    if (emailValid) {
      return null;
    } else {
      return FormEmailStringFieldValidationError();
    }
  };
}