import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

class FormUrlStringFieldValidationError extends FormStringFieldValidationError {
  static final urlRegex = RegExp(
      r"(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)");

  @override
  String createErrorDescription(BuildContext context) =>
      tr("form.field.text.url.error.invalid.desc");

  static FormValueFieldValidation createValidator() => (currentValue) {
    bool emailValid = urlRegex.hasMatch(currentValue ?? "");
    if (emailValid) {
      return null;
    } else {
      return FormUrlStringFieldValidationError();
    }
  };
}