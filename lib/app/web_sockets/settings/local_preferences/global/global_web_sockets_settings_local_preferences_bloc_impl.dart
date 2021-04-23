import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preferences_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';

class GlobalWebSocketsSettingsLocalPreferencesBloc
    extends WebSocketsSettingsLocalPreferencesBloc<WebSocketsSettings>
    implements IGlobalWebSocketsSettingsLocalPreferencesBloc {
  GlobalWebSocketsSettingsLocalPreferencesBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, "webSockets.settings.global");

  @override
  WebSocketsSettings get defaultPreferenceValue => WebSocketsSettings(
        typeString:
            WebSocketsHandlingType.foregroundAndBackground.toJsonValue(),
      );
}
