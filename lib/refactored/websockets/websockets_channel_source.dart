import 'dart:async';

import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/websockets/websockets_model.dart';

abstract class IWebSocketsChannelSource<T extends WebSocketsEvent>
    implements Disposable {
  Uri get url;

  Stream<T> get eventsStream;
}
