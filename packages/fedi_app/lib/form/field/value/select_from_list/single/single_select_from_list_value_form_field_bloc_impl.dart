import 'package:fedi_app/form/field/value/select_from_list/select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/value_form_field_validation.dart';

abstract class SingleSelectFromListValueFormFieldBloc<T>
    extends SelectFromListValueFormFieldBloc<T>
    implements ISingleSelectFromListValueFormFieldBloc<T> {
  SingleSelectFromListValueFormFieldBloc({
    required T originValue,
    required bool isEnabled,
    required bool isNullValuePossible,
    required List<FormValueFieldValidation<T>> validators,
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
