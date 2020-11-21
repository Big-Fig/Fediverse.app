import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:fedi/app/web_sockets/handling_type/web_sockets_handling_type_model.dart';
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
  WebSocketsHandlingType get type => settingsData.type;

  @override
  Stream<WebSocketsHandlingType> get typeStream =>
      settingsDataStream.map((settings) => settings.type);

  @override
  void changeType(WebSocketsHandlingType value) {
    updateInstanceSettings(
      settingsData.copyWith(
        typeString: value.toJsonValue(),
      ),
    );
  }

  @override
  bool get isRealtimeWebSocketsEnabled =>
      type == WebSocketsHandlingType.currentScreenAndAllIndicators ||
      type == WebSocketsHandlingType.onlyForCurrentScreen;
}
