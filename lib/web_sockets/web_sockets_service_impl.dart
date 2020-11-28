import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_impl.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';
import 'package:fedi/web_sockets/web_sockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("web_sockets_service_impl.dart");

class WebSocketsService extends DisposableOwner implements IWebSocketsService {
  @visibleForTesting
  final Map<Uri, IWebSocketsChannel> urlToChannel = {};

  WebSocketsService() {
    addDisposable(
      disposable: CustomDisposable(
        () async {
          urlToChannel.values.forEach((channel) => channel.dispose());
          urlToChannel.clear();
        },
      ),
    );
  }

  @override
  IWebSocketsChannel<T>
      getOrCreateWebSocketsChannel<T extends WebSocketsEvent>({
    @required IWebSocketsChannelConfig<T> config,
    @required WebSocketsListenType listenType,
  }) {
    var url = config.calculateWebSocketsUrl();
    if (!urlToChannel.containsKey(url)) {
      urlToChannel[url] = createChannel<T>(config);
    }

    return urlToChannel[url];
  }

  IWebSocketsChannel createChannel<T extends WebSocketsEvent>(
      IWebSocketsChannelConfig<T> config) {
    _logger.finest(() => "createChannel $config");

    return WebSocketsChannel<T>(config: config);
  }
}
