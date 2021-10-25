import 'dart:async';

import 'web_sockets_listener_model.dart';

class WebSocketsChannelHandlerListener<T>
    implements IWebSocketsChannelHandlerListener<T> {
  final FutureOr Function(T event) onEventAction;

  WebSocketsChannelHandlerListener({
    required this.onEventAction,
  });

  @override
  FutureOr onEvent(T event) => onEventAction(event);
}
