import 'package:fedi_app/form/field/value/value_form_field_validation.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class MultiSelectFromListValueFormFieldNonNullAndNonEmptyValidationError
    extends ValueFormFieldValidationError {
  @override
  String createErrorDescription(BuildContext context) =>
      S.of(context).form_field_value_error_null_desc;

  static FormValueFieldValidation createValidator() => (dynamic currentValue) {
        if (currentValue != null) {
          // todo: refactor with generic
          if (currentValue is Iterable) {
            if (currentValue.isEmpty) {
              return const MultiSelectFromListValueFormFieldNonNullAndNonEmptyValidationError();
            } else {
              return null;
            }
          } else {
            return null;
          }
        } else {
          return const MultiSelectFromListValueFormFieldNonNullAndNonEmptyValidationError();
        }
      };

  const MultiSelectFromListValueFormFieldNonNullAndNonEmptyValidationError();
}
