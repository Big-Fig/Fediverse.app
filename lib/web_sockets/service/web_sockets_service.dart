import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';
import 'package:flutter/widgets.dart';

abstract class IWebSocketsService extends IDisposable {
  IWebSocketsChannel<T>
      getOrCreateWebSocketsChannel<T extends WebSocketsEvent>({
    @required IWebSocketsChannelConfig<T> config,
  });
}
