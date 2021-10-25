import 'package:easy_dispose/easy_dispose.dart';

import 'channel/web_sockets_channel_bloc.dart';
import 'channel/web_sockets_channel_model.dart';
import 'event/web_sockets_event_model.dart';
import 'mode/settings/web_sockets_mode_settings_bloc.dart';

abstract class IWebSocketsService implements IDisposable {
  IWebSocketsModeSettingsBloc get webSocketsModeSettingsBloc;

  IWebSocketsChannelBloc<T>
      getOrCreateWebSocketsChannel<T extends IWebSocketsEvent>({
    required IWebSocketsChannelConfig config,
    required WebSocketsEventParser<T> eventParser,
  });
}
