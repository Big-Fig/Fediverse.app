import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/widgets.dart';

abstract class SingleSelectFromListValueFormFieldBloc<T> extends ValueFormFieldBloc<T>
    implements ISingleSelectFromListValueFormFieldBloc<T> {
  SingleSelectFromListValueFormFieldBloc({
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
