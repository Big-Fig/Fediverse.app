import 'package:fedi/app/timeline/type/form/timeline_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/timeline/type/timeline_type_model.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/material.dart';

class TimelineTypeSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<TimelineType>
    implements ITimelineTypeSingleFromListValueFormFieldBloc {
  @override
  final List<TimelineType> possibleValues;

  TimelineTypeSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = false,
    this.possibleValues = TimelineType.values,
    @required TimelineType originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<TimelineType>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
