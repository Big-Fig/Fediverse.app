import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/widgets.dart';

abstract class MultiSelectFromListValueFormFieldBloc<T>
    extends ValueFormFieldBloc<List<T>>
    implements IMultiSelectFromListValueFormFieldBloc<T> {
  MultiSelectFromListValueFormFieldBloc({
    @required List<T> originValue,
    @required bool isEnabled,
    @required bool isNullValuePossible,
    @required List<FormValueFieldValidation<List<T>>> validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );

  @override
  void toggleValue(T value) {
    var currentValueList = currentValue ?? [];
    if (currentValueList.contains(value)) {
      currentValueList.remove(value);
    } else {
      currentValueList.add(value);
    }

    changeCurrentValue([...currentValueList]);
  }
}
