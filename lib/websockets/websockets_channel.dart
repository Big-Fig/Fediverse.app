import 'dart:async';

import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/websockets/websockets_channel_model.dart';
import 'package:fedi/websockets/websockets_model.dart';

abstract class IWebSocketsChannel<T extends WebSocketsEvent>
    implements IDisposable {
  IWebSocketsChannelConfig<T> get config;

  Stream<T> get eventsStream;

  bool get isPaused;
}
