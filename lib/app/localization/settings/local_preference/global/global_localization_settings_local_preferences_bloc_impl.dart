import 'package:fedi/app/localization/settings/local_preference/global/global_localization_settings_local_preferences_bloc.dart';
import 'package:fedi/app/localization/settings/local_preference/localization_settings_local_preferences_bloc_impl.dart';
import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class GlobalLocalizationSettingsLocalPreferenceBloc
    extends LocalizationSettingsLocalPreferenceBloc<LocalizationSettings>
    implements IGlobalLocalizationSettingsLocalPreferenceBloc {
  GlobalLocalizationSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, "localization.settings.global");

  static const defaultValue = LocalizationSettings(
    localizationLocale: null,
  );

  @override
  LocalizationSettings get defaultPreferenceValue => defaultValue;
}
