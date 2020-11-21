import 'package:fedi/generated/l10n.dart';
import 'package:fedi/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

class FormNonNullValueFieldValidationError
    extends FormValueFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_value_error_null_desc;

  static FormValueFieldValidation createValidator() => (currentValue) {
        if (currentValue != null) {
          return null;
        } else {
          return FormNonNullValueFieldValidationError();
        }
      };
}
