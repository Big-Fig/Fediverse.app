import 'package:easy_dispose/easy_dispose.dart';

import 'channel/web_sockets_channel_bloc.dart';
import 'channel/web_sockets_channel_bloc_impl.dart';
import 'channel/web_sockets_channel_model.dart';
import 'event/web_sockets_event_model.dart';
import 'mode/settings/web_sockets_mode_settings_bloc.dart';
import 'web_sockets_service.dart';

class WebSocketsService extends DisposableOwner implements IWebSocketsService {
  @override
  final IWebSocketsModeSettingsBloc webSocketsModeSettingsBloc;
  final Map<IWebSocketsChannelConfig, IWebSocketsChannelBloc> configToChannels =
      {};

  WebSocketsService({
    required this.webSocketsModeSettingsBloc,
  }) {
    addCustomDisposable(() async {
      for (final channel in configToChannels.values) {
        await channel.dispose();
      }
      configToChannels.clear();
    });
  }

  @override
  IWebSocketsChannelBloc<T>
      getOrCreateWebSocketsChannel<T extends IWebSocketsEvent>({
    required IWebSocketsChannelConfig config,
    required WebSocketsEventParser<T> eventParser,
  }) {
    IWebSocketsChannelBloc<T> webSocketsChannelBloc;
    if (configToChannels.containsKey(config)) {
      webSocketsChannelBloc =
          configToChannels[config]! as IWebSocketsChannelBloc<T>;
    } else {
      webSocketsChannelBloc = WebSocketsChannelBloc<T>(
        webSocketsModeSettingsBloc: webSocketsModeSettingsBloc,
        config: config,
        eventParser: eventParser,
      );
      configToChannels[config] = webSocketsChannelBloc;
    }

    return webSocketsChannelBloc;
  }
}
