import 'package:easy_dispose/easy_dispose.dart';
import '../channel/web_sockets_channel_model.dart';
import '../web_sockets_model.dart';

abstract class IWebSocketsChannel<T extends WebSocketsEvent>
    implements IDisposable {
  IWebSocketsChannelConfig<T> get config;

  IDisposable listenForEvents({
    required WebSocketChannelListener<T> listener,
  });
}
