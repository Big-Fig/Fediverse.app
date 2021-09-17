import 'package:fedi/app/timeline/settings/only_in_custom_list/timeline_settings_only_in_custom_list_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:unifedi_api/unifedi_api.dart';

class TimelineSettingsOnlyInCustomListFormFieldBloc
    extends ValueFormFieldBloc<IUnifediApiList?>
    implements ITimelineSettingsOnlyInCustomListFormFieldBloc {
  TimelineSettingsOnlyInCustomListFormFieldBloc({
    bool isNullValuePossible = true,
    required IUnifediApiList? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<IUnifediApiList>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
