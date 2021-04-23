import 'package:fedi/app/web_sockets/settings/local_preferences/instance/instance_web_sockets_settings_local_preferences_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class InstanceWebSocketsSettingsLocalPreferencesBloc
    extends WebSocketsSettingsLocalPreferencesBloc<WebSocketsSettings?>
    implements IInstanceWebSocketsSettingsLocalPreferencesBloc {
  InstanceWebSocketsSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService, {
    required String userAtHost,
  }) : super(
          preferencesService,
          "webSockets.settings.instance.$userAtHost",
        );

  @override
  WebSocketsSettings? get defaultPreferenceValue => null;
}
