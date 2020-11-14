import 'package:fedi/app/localization/settings/edit/edit_localization_settings_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditLocalizationSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditLocalizationSettingsBloc {
  final ILocalizationSettingsBloc localizationSettingBloc;

  @override
  final IFormValueFieldBloc<LocalizationLocale> localizationLocaleFieldBloc;

  EditLocalizationSettingsBloc({
    @required this.localizationSettingBloc,
  }) : localizationLocaleFieldBloc = FormValueFieldBloc<LocalizationLocale>(
          originValue: localizationSettingBloc.localizationLocale,
          validators: [],
        ) {
    _subscribeForLocalizationLocale();
  }

  void _subscribeForLocalizationLocale() {
    addDisposable(
      streamSubscription:
          localizationSettingBloc.localizationLocaleStream.distinct().listen(
        (newValue) {
          localizationLocaleFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: localizationLocaleFieldBloc.currentValueStream.listen(
        (value) {
          localizationSettingBloc.changeLocalizationLocale(value);
        },
      ),
    );
  }
}
