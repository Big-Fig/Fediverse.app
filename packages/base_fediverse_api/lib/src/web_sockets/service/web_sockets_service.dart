import 'package:easy_dispose/easy_dispose.dart';
import '../channel/web_sockets_channel.dart';
import '../channel/web_sockets_channel_model.dart';
import '../web_sockets_model.dart';

abstract class IWebSocketsService extends IDisposable {
  IWebSocketsChannel<T>
      getOrCreateWebSocketsChannel<T extends WebSocketsEvent>({
    required IWebSocketsChannelConfig<T> config,
  });
}
