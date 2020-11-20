import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:fedi/app/web_sockets/settings/local_preferences/web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:flutter/widgets.dart';

class WebSocketsSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<WebSocketsSettings>
    implements IWebSocketsSettingsBloc {
  WebSocketsSettingsBloc({
    @required
        IWebSocketsSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    @required
        IWebSocketsSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
  }) : super(
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
    updateInstanceSettings(
      settingsData.copyWith(
        typeString: value.toJsonValue(),
      ),
    );
  }

  @override
  bool get isRealtimeWebSocketsEnabled =>
      type == WebSocketsSettingsType.currentScreenAndAllIndicators ||
      type == WebSocketsSettingsType.onlyForCurrentScreen;
}
