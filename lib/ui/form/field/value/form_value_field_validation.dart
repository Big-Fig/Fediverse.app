import 'package:fedi/ui/form/field/form_field_validation.dart';

typedef FormValueFieldValidationError FormValueFieldValidation<T>(
    T currentValue);

abstract class FormValueFieldValidationError extends FormFieldValidationError {}
