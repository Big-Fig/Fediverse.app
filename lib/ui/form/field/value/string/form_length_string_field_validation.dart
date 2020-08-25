import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

class FormLengthStringFieldValidationError extends FormStringFieldValidationError {
  final int minLength;
  final int maxLength;

  FormLengthStringFieldValidationError(
      {@required this.minLength, @required this.maxLength}) {
    assert(minLength != null || maxLength != null);
  }

  @override
  String createErrorDescription(BuildContext context) {
    if (minLength != null && maxLength != null) {
      return tr("form.field.text.error.length.min_and_max.desc",
          args: [minLength.toString(), maxLength.toString()]);
    } else if (minLength != null) {
      return tr("form.field.text.error.length.min_only.desc",
          args: [minLength.toString()]);
    } else if (maxLength != null) {}
    return tr("form.field.text.error.length.max_only.desc",
        args: [maxLength.toString()]);
  }

  static FormValueFieldValidation createValidator(
      {@required int minLength, @required int maxLength}) =>
          (currentValue) {
        assert(minLength != null || maxLength != null);
        var length = currentValue?.length ?? 0;
        bool moreThanMin;
        if (minLength != null) {
          moreThanMin = length >= (minLength);
        } else {
          moreThanMin = true;
        }
        bool lessThanMax;
        if (maxLength != null) {
          lessThanMax = length < maxLength;
        } else {
          lessThanMax = true;
        }

        if (moreThanMin && lessThanMax) {
          return null;
        } else {
          return FormLengthStringFieldValidationError(
              minLength: minLength, maxLength: maxLength);
        }
      };
}
