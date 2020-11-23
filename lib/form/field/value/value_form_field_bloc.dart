import 'package:fedi/form/field/form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';

abstract class IValueFormFieldBloc<T> extends IFormFieldBloc {
  bool get isNullValuePossible;

  T get originValue;

  T get currentValue;

  Stream<T> get currentValueStream;

  void changeCurrentValue(T newValue);

  List<FormValueFieldValidation<T>> get validators;

  void updateValidators(List<FormValueFieldValidation<T>> validators);
}
