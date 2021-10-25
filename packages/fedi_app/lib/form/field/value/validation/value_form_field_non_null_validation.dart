import 'package:fedi_app/form/field/value/value_form_field_validation.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class ValueFormFieldNonNullValidationError
    extends ValueFormFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_value_error_null_desc;

  static FormValueFieldValidation createValidator() => (dynamic currentValue) {
        if (currentValue != null) {
          return null;
        } else {
          return ValueFormFieldNonNullValidationError();
        }
      };
}
