import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IWebSocketsSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<WebSocketsSettings> {
  bool get isRealtimeWebSocketsEnabled;

  static IWebSocketsSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IWebSocketsSettingsBloc>(context, listen: listen);

  WebSocketsSettingsType get type;

  Stream<WebSocketsSettingsType> get typeStream;

  void changeType(WebSocketsSettingsType value);
}
