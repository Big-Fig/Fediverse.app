import 'package:fedi/form/field/value/string/validation/string_value_form_field_validation.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/widgets.dart';

class StringValueFormFieldLengthValidationError
    extends StringValueFormFieldValidationError {
  final int? minLength;
  final int? maxLength;

  StringValueFormFieldLengthValidationError({
    required this.minLength,
    required this.maxLength,
  }): assert(minLength != null || maxLength != null);

  @override
  String createErrorDescription(BuildContext context) {
    if (minLength != null && maxLength != null) {
      return S
          .of(context)
          .form_field_text_error_length_minAndMax_desc(minLength!, maxLength!);
    } else if (minLength != null) {
      return S
          .of(context)
          .form_field_text_error_length_minOnly_desc(minLength!);
    } else if (maxLength != null) {
      return S
          .of(context)
          .form_field_text_error_length_maxOnly_desc(maxLength!);
    } else {
      throw 'Invalid minLength $minLength || maxLength $maxLength';
    }
  }

  static FormValueFieldValidation<String> createValidator({
    required int? minLength,
    required int? maxLength,
  }) =>
      (String? currentValue) {
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
          return StringValueFormFieldLengthValidationError(
            minLength: minLength,
            maxLength: maxLength,
          );
        }
      };
}
