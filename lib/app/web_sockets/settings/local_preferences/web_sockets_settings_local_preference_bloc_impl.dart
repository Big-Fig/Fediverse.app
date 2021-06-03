import 'package:fedi/app/web_sockets/settings/local_preferences/web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

abstract class WebSocketsSettingsLocalPreferenceBloc<
        T extends WebSocketsSettings?> extends ObjectLocalPreferenceBloc<T>
    implements IWebSocketsSettingsLocalPreferenceBloc<T> {
  WebSocketsSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
    String key,
  ) : super(
          preferencesService: preferencesService,
          key: key,
          // ignore: no-magic-number
          schemaVersion: 2,
          jsonConverter: (json) => WebSocketsSettings.fromJson(json) as T,
        );
}
