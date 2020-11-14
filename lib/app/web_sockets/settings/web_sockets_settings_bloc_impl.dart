import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';

class PostStatusSettingBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<WebSocketsSettings>
    implements IWebSocketsSettingsBloc {
  PostStatusSettingBloc(
    IWebSocketsSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    IWebSocketsSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
  ) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  WebSocketsSettingsType get type => settingsData.type;

  @override
  Stream<WebSocketsSettingsType> get typeStream =>
      settingsDataStream.map((settings) => settings.type);

  @override
  void changeType(WebSocketsSettingsType value) {
    if (isInstance) {
      instanceLocalPreferencesBloc.setValue(
        instanceSettingsData.copyWith(
          typeString: value.toJsonValue(),
        ),
      );
    } else {
      globalLocalPreferencesBloc.setValue(
        globalSettingsData.copyWith(
          typeString: value.toJsonValue(),
        ),
      );
    }
  }

  @override
  bool get isRealtimeWebSocketsEnabled =>
      type == WebSocketsSettingsType.currentScreenAndAllIndicators ||
      type == WebSocketsSettingsType.onlyForCurrentScreen;
}
