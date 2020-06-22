import 'package:fedi/ui/form/form_field_bloc.dart';

abstract class IFormValueFieldBloc<T> extends IFormFieldBloc {
  T get originValue;

  T get currentValue;

  Stream<T> get currentValueStream;

  void changeCurrentValue(T newValue);
}
