import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';

import '../../event/web_sockets_event_model.dart';
import '../../listener/web_sockets_listener_model.dart';
import 'type/websockets_channel_handler_type_model.dart';

abstract class IWebSocketsChannelHandlerBloc<T extends IWebSocketsEvent>
    implements IDisposable {
  List<IWebSocketsChannelHandlerListener<T>> get listeners;

  Stream<List<IWebSocketsChannelHandlerListener<T>>> get listenersStream;

  WebSocketsChannelHandlerType get handlerType;

  Stream<WebSocketsChannelHandlerType> get handlerTypeStream;

  IDisposable listenForEvents({
    required IWebSocketsChannelHandlerListener<T> listener,
  });
}

extension IWebSocketsChannelHandlerBlocExtension
    on IWebSocketsChannelHandlerBloc {
  int get listenersCount => listeners.length;

  Stream<int> get listenersCountStream => listenersStream.map(
        (listenersCount) => listeners.length,
      );

  bool get isHaveListeners => listenersCount > 0;

  Stream<bool> get isHaveListenersStream =>
      listenersCountStream.map((listenersCount) => listenersCount > 0);
}
