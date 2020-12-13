import 'package:fedi/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/material.dart';

class ToastHandlingTypeSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<ToastHandlingType>
    implements IToastHandlingTypeSingleFromListValueFormFieldBloc {
  @override
  final List<ToastHandlingType> possibleValues;

  ToastHandlingTypeSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = false,
    this.possibleValues = ToastHandlingType.values,
    @required ToastHandlingType originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<ToastHandlingType>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
