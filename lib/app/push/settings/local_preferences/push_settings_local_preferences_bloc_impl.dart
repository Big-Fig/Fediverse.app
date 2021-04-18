import 'package:fedi/app/push/settings/local_preferences/push_settings_local_preferences_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class PushSettingsLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<PushSettings?>
    implements IPushSettingsLocalPreferencesBloc {
  PushSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => PushSettings.fromJson(json),
        );
}
