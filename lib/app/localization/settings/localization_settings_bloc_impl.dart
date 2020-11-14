import 'package:fedi/app/localization/settings/local_preference/localization_settings_local_preferences_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/localization/settings/localization_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:flutter/widgets.dart';

class LocalizationSettingsBloc extends DisposableOwner
    implements ILocalizationSettingsBloc {
  ILocalizationSettingsLocalPreferencesBloc
      localizationSettingsLocalPreferencesBloc;

  LocalizationSettingsBloc({
    @required this.localizationSettingsLocalPreferencesBloc,
  }) : super();

  LocalizationSettings get settingsData =>
      localizationSettingsLocalPreferencesBloc.value;

  Stream<LocalizationSettings> get settingsDataStream =>
      localizationSettingsLocalPreferencesBloc.stream;

  @override
  LocalizationLocale get localizationLocale => settingsData.localizationLocale;

  @override
  Stream<LocalizationLocale> get localizationLocaleStream =>
      settingsDataStream.map((settings) => settings.localizationLocale);

  @override
  void changeLocalizationLocale(LocalizationLocale value) {
    localizationSettingsLocalPreferencesBloc.setValue(
      settingsData.copyWith(
        localizationLocale: value,
      ),
    );
  }
}
