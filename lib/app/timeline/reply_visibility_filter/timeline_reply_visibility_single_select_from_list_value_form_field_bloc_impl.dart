import 'package:fedi/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:unifedi_api/unifedi_api.dart';

class TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<
        UnifediApiReplyVisibilityFilter?>
    implements
        ITimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc {
  @override
  final List<UnifediApiReplyVisibilityFilter> possibleValues;

  TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = false,
    this.possibleValues = UnifediApiReplyVisibilityFilter.values,
    required UnifediApiReplyVisibilityFilter? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<UnifediApiReplyVisibilityFilter>> validators =
        const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
