import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

class FormEmailStringFieldValidationError extends FormStringFieldValidationError {
  static final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  String createErrorDescription(BuildContext context) =>
      tr("form.field.text.email.error.invalid.desc");

  static FormValueFieldValidation createValidator() => (currentValue) {
    bool emailValid = emailRegex.hasMatch(currentValue ?? "");
    if (emailValid) {
      return null;
    } else {
      return FormEmailStringFieldValidationError();
    }
  };
}