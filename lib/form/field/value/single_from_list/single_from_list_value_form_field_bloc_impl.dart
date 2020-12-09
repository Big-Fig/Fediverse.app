import 'package:fedi/form/field/value/single_from_list/single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/widgets.dart';

abstract class SingleFromListValueFormFieldBloc<T> extends ValueFormFieldBloc<T>
    implements ISingleFromListValueFormFieldBloc<T> {
  SingleFromListValueFormFieldBloc({
    @required T originValue,
    @required bool isEnabled,
    @required bool isNullValuePossible,
    @required List<FormValueFieldValidation<T>> validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
