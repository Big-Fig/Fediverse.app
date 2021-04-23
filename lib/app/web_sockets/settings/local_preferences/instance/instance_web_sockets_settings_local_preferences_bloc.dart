import 'package:fedi/app/web_sockets/settings/local_preferences/web_sockets_settings_local_preference_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IInstanceWebSocketsSettingsLocalPreferencesBloc
    implements IWebSocketsSettingsLocalPreferencesBloc<WebSocketsSettings?> {
  static IInstanceWebSocketsSettingsLocalPreferencesBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IInstanceWebSocketsSettingsLocalPreferencesBloc>(
        context,
        listen: listen,
      );
}
