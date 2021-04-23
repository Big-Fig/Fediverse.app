import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';

class BoolValueFormFieldBloc<T extends bool?> extends ValueFormFieldBloc<T>
    implements IBoolValueFormFieldBloc<T> {
  BoolValueFormFieldBloc({
    required T originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    List<FormValueFieldValidation<T>> validators = const [],
  }) : super(
          originValue: originValue,
          validators: validators,
          isEnabled: isEnabled,
          isNullValuePossible: isNullValuePossible,
        );

  @override
  void changeCurrentValue(T newValue) {
    if (newValue == currentValue) {
      return;
    }
    super.changeCurrentValue(newValue);
  }
}
