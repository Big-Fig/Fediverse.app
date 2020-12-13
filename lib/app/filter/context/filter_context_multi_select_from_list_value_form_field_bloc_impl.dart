import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/multi/multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
import 'package:flutter/material.dart';

class FilterContextMultiSelectFromListValueFormFieldBloc
    extends MultiSelectFromListValueFormFieldBloc<MastodonFilterContextType>
    implements IFilterContextMultiSelectFromListValueFormFieldBloc {
  @override
  List<MastodonFilterContextType> get possibleValues =>
      MastodonFilterContextType.values;

  FilterContextMultiSelectFromListValueFormFieldBloc({
    @required List<MastodonFilterContextType> originValue,
    bool isEnabled = true,
    bool isNullValuePossible = false,
    @required
        List<FormValueFieldValidation<List<MastodonFilterContextType>>>
            validators,
  }) : super(

    originValue: originValue,
    isEnabled: isEnabled,
    isNullValuePossible: isNullValuePossible,
    validators: validators,
  );


}
