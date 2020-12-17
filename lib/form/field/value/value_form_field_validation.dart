import 'package:fedi/form/field/form_field_validation.dart';

typedef ValueFormFieldValidationError FormValueFieldValidation<T>(
    T currentValue);

abstract class ValueFormFieldValidationError extends FormFieldValidationError {
  const ValueFormFieldValidationError();
}
