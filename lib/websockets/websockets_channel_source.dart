import 'dart:async';

import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/websockets/websockets_model.dart';

abstract class IWebSocketsChannelSource<T extends WebSocketsEvent>
    implements Disposable {
  Uri get url;

  Stream<T> get eventsStream;
}
