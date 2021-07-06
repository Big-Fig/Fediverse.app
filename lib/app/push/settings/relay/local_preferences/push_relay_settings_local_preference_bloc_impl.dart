import 'package:fedi/app/push/settings/relay/local_preferences/push_relay_settings_local_preference_bloc.dart';
import 'package:fedi/app/push/settings/relay/push_relay_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class PushRelaySettingsLocalPreferenceBloc<
        T extends PushRelaySettings?> extends ObjectLocalPreferenceBloc<T>
    implements IPushRelaySettingsLocalPreferenceBloc<T> {
  PushRelaySettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          schemaVersion: 1,
          jsonConverter: (json) => PushRelaySettings.fromJson(json) as T,
        );
}
