import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/localization/settings/local_preferences/localization_settings_local_preference_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:fedi/localization/localization_model.dart';

class LocalizationSettingsBloc extends DisposableOwner
    implements ILocalizationSettingsBloc {
  final ILocalizationSettingsLocalPreferenceBloc<LocalizationSettings>
      localizationSettingsLocalPreferencesBloc;

  LocalizationSettingsBloc({
    required this.localizationSettingsLocalPreferencesBloc,
  });

  @override
  LocalizationSettings get settingsData =>
      localizationSettingsLocalPreferencesBloc.value;

  @override
  Stream<LocalizationSettings> get settingsDataStream =>
      localizationSettingsLocalPreferencesBloc.stream;

  @override
  LocalizationLocale? get localizationLocale => settingsData.localizationLocale;

  @override
  Stream<LocalizationLocale?> get localizationLocaleStream =>
      settingsDataStream.map(
        (settings) => settings.localizationLocale,
      );

  @override
  Future changeLocalizationLocale(LocalizationLocale? value) => updateSettings(
        LocalizationSettings(localizationLocale: value),
        // copyWith dont set null values
        // settingsData.copyWith(localizationLocale: value),
      );

  @override
  Future updateSettings(LocalizationSettings newSettings) async {
    await localizationSettingsLocalPreferencesBloc.setValue(
      newSettings,
    );
  }
}
