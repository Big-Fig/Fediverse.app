import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/web_sockets/settings/web_sockets_settings_model.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IWebSocketsSettingsBloc
    implements
        IGlobalOrInstanceSettingsBloc<WebSocketsSettings>,
        IWebSocketsModeSettingsBloc {
  bool get isEnabled;

  static IWebSocketsSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IWebSocketsSettingsBloc>(context, listen: listen);
}
