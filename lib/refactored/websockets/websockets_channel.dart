import 'dart:async';

import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/websockets/websockets_channel_model.dart';
import 'package:fedi/refactored/websockets/websockets_channel_source.dart';
import 'package:fedi/refactored/websockets/websockets_model.dart';

abstract class IWebSocketsChannel<T extends WebSocketsEvent> implements Disposable {
  IWebSocketsChannelConfig<T> get config;

  Stream<T> get eventsStream;

  bool get isPaused;
}
