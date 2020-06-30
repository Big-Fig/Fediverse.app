
import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

class NonEmptyStringFieldValidationError extends FormStringFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      tr("form.field.text.error.empty.desc");

  static FormValueFieldValidation createValidator() => (currentValue) {
    if (currentValue?.isNotEmpty == true) {
      return null;
    } else {
      return NonEmptyStringFieldValidationError();
    }
  };
}

