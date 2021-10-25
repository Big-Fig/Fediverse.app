import 'package:fedi_app/form/field/value/bool/validation/bool_value_form_field_validation.dart';
import 'package:fedi_app/form/field/value/value_form_field_validation.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class BoolValueFormFieldOnlyTrueValidationError
    extends BoolValueFormFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_bool_onlyTrue_error_desc;

  static FormValueFieldValidation<bool> createValidator() =>
      (bool? currentValue) {
        if (currentValue == true) {
          return null;
        } else {
          return const BoolValueFormFieldOnlyTrueValidationError();
        }
      };

  const BoolValueFormFieldOnlyTrueValidationError();
}
