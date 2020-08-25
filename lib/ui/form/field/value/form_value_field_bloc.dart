import 'package:fedi/ui/form/field/form_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';

abstract class IFormValueFieldBloc<T> extends IFormFieldBloc {
  T get originValue;

  T get currentValue;

  Stream<T> get currentValueStream;

  void changeCurrentValue(T newValue);

  List<FormValueFieldValidation<T>> get validators;
}
