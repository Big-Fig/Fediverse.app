import 'package:fedi/form/field/value/form_value_field_bloc_impl.dart';
import 'package:fedi/form/field/value/form_value_field_validation.dart';
import 'package:fedi/form/field/value/list/form_list_value_field_bloc.dart';
import 'package:flutter/widgets.dart';

class FormListValueFieldBloc<T> extends FormValueFieldBloc<List<T>>
    implements IFormListValueFieldBloc<T> {
  FormListValueFieldBloc({
    @required List<T> originValue,
    @required List<FormValueFieldValidation<List<T>>> validators,
  }) : super(
          originValue: originValue,
          validators: validators,
        );
}
