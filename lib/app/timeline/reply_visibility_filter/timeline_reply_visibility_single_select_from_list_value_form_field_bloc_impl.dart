import 'package:fedi/app/timeline/reply_visibility_filter/timeline_reply_visibility_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/pleroma/api/timeline/pleroma_api_timeline_model.dart';

class TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<PleromaApiReplyVisibilityFilter?>
    implements
        ITimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc {
  @override
  final List<PleromaApiReplyVisibilityFilter> possibleValues;

  TimelineReplyVisibilityFilterSelectSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = false,
    this.possibleValues = PleromaApiReplyVisibilityFilter.values,
    required PleromaApiReplyVisibilityFilter? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<PleromaApiReplyVisibilityFilter>> validators =
        const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
