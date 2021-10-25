import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/localization/settings/local_preferences/localization_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_model.dart';
import 'package:fedi_app/localization/localization_model.dart';

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
  Future<void> changeLocalizationLocale(LocalizationLocale? value) =>
      updateSettings(
        LocalizationSettings(localizationLocale: value),
        // copyWith dont set null values
        // settingsData.copyWith(localizationLocale: value),
      );

  @override
  Future<void> updateSettings(LocalizationSettings newSettings) async {
    await localizationSettingsLocalPreferencesBloc.setValue(
      newSettings,
    );
  }
}
