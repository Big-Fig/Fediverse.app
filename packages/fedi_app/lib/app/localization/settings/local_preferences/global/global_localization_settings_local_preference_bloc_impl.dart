import 'package:fedi_app/app/localization/settings/local_preferences/global/global_localization_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/localization/settings/local_preferences/localization_settings_local_preference_bloc_impl.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

class GlobalLocalizationSettingsLocalPreferenceBloc
    extends LocalizationSettingsLocalPreferenceBloc<LocalizationSettings>
    implements IGlobalLocalizationSettingsLocalPreferenceBloc {
  GlobalLocalizationSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, 'localization.settings.global');

  static const defaultValue = LocalizationSettings(
    localizationLocale: null,
  );

  @override
  LocalizationSettings get defaultPreferenceValue => defaultValue;
}
