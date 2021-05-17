import 'package:fedi/app/web_sockets/settings/local_preferences/global/global_web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/web_sockets_settings_local_preference_bloc_impl.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';

class GlobalWebSocketsSettingsLocalPreferenceBloc
    extends WebSocketsSettingsLocalPreferenceBloc<WebSocketsSettings>
    implements IGlobalWebSocketsSettingsLocalPreferenceBloc {
  GlobalWebSocketsSettingsLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(preferencesService, 'webSockets.settings.global');

  static final WebSocketsSettings defaultValue = WebSocketsSettings.fromEnum(
    handlingType: WebSocketsHandlingType.foregroundAndBackground,
  );

  @override
  WebSocketsSettings get defaultPreferenceValue => defaultValue;
}
