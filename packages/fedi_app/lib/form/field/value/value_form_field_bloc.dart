import 'package:fedi_app/form/field/form_field_bloc.dart';
import 'package:fedi_app/form/field/value/value_form_field_validation.dart';

abstract class IValueFormFieldBloc<T> extends IFormFieldBloc {
  bool get isNullValuePossible;

  T get originValue;

  T get currentValue;

  Stream<T> get currentValueStream;

  void changeCurrentValue(T newValue);

  List<FormValueFieldValidation<T>> get validators;

  void updateValidators(List<FormValueFieldValidation<T>> validators);
}

extension IValueFormFieldBlocExtension on IValueFormFieldBloc {
  bool get isValueExist => currentValue != null;

  Stream<bool> get isValueExistStream =>
      currentValueStream.map((dynamic currentValue) => currentValue != null);
}
