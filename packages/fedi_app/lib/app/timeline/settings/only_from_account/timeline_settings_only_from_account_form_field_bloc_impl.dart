import 'package:fedi_app/app/timeline/settings/only_from_account/timeline_settings_only_from_account_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/value_form_field_validation.dart';
import 'package:unifedi_api/unifedi_api.dart';

class TimelineSettingsOnlyFromAccountFormFieldBloc
    extends ValueFormFieldBloc<IUnifediApiAccount?>
    implements ITimelineSettingsOnlyFromAccountFormFieldBloc {
  TimelineSettingsOnlyFromAccountFormFieldBloc({
    bool isNullValuePossible = true,
    required IUnifediApiAccount? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<IUnifediApiAccount>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
