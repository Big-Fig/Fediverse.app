import 'dart:async';

// ignore: one_member_abstracts
abstract class IWebSocketsChannelHandlerListener<T> {
  FutureOr<void> onEvent(T event);
}
