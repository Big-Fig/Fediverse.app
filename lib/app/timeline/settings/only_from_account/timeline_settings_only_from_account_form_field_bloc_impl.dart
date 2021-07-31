import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';

class TimelineSettingsOnlyFromAccountFormFieldBloc
    extends ValueFormFieldBloc<IPleromaApiAccount?>
    implements ITimelineSettingsOnlyFromAccountFormFieldBloc {
  TimelineSettingsOnlyFromAccountFormFieldBloc({
    bool isNullValuePossible = true,
    required IPleromaApiAccount? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<IPleromaApiAccount>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
