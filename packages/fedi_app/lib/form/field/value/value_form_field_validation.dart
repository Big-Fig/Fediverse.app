import 'package:fedi_app/form/field/form_field_validation.dart';

typedef FormValueFieldValidation<T> = ValueFormFieldValidationError? Function(
  T? currentValue,
);

abstract class ValueFormFieldValidationError extends FormFieldValidationError {
  const ValueFormFieldValidationError();
}
