
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/form/field/value/string/form_string_field_validation.dart';
import 'package:fedi/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

class FormNonEmptyStringFieldValidationError extends FormStringFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_text_error_empty_desc;

  static FormValueFieldValidation createValidator() => (currentValue) {
    if (currentValue?.isNotEmpty == true) {
      return null;
    } else {
      return FormNonEmptyStringFieldValidationError();
    }
  };
}

