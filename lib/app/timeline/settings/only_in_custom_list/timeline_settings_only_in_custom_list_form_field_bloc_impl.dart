import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';

class TimelineSettingsOnlyInCustomListFormFieldBloc
    extends ValueFormFieldBloc<IPleromaList?>
    implements ITimelineSettingsOnlyInCustomListFormFieldBloc {
  TimelineSettingsOnlyInCustomListFormFieldBloc({
    bool isNullValuePossible = true,
    required IPleromaList? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<IPleromaList>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
