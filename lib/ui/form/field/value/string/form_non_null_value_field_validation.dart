import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

class FormNonNullValueFieldValidationError
    extends FormValueFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      tr("form.field.value.error.null.desc");

  static FormValueFieldValidation createValidator() => (currentValue) {
        if (currentValue != null) {
          return null;
        } else {
          return FormNonNullValueFieldValidationError();
        }
      };
}
