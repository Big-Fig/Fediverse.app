import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IWebSocketsSettingsLocalPreferencesBloc
    implements ILocalPreferenceBloc<WebSocketsSettings> {
  static IWebSocketsSettingsLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IWebSocketsSettingsLocalPreferencesBloc>(context,
          listen: listen);
}
