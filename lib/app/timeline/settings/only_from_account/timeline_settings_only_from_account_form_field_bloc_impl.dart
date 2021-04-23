import 'package:fedi/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/pleroma/api/account/pleroma_account_model.dart';

class TimelineSettingsOnlyFromAccountFormFieldBloc
    extends ValueFormFieldBloc<IPleromaAccount?>
    implements ITimelineSettingsOnlyFromAccountFormFieldBloc {
  TimelineSettingsOnlyFromAccountFormFieldBloc({
    bool isNullValuePossible = true,
    required IPleromaAccount? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<IPleromaAccount>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
