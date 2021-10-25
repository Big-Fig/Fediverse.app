import 'package:fedi_app/app/localization/settings/local_preferences/localization_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi_app/local_preferences/local_preferences_service.dart';

abstract class LocalizationSettingsLocalPreferenceBloc<
        T extends LocalizationSettings?> extends ObjectLocalPreferenceBloc<T>
    implements ILocalizationSettingsLocalPreferenceBloc<T> {
  LocalizationSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => LocalizationSettings.fromJson(json) as T,
        );
}
