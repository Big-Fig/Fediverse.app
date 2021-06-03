import 'dart:async';

import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';

abstract class IWebSocketsChannelSource<T extends WebSocketsEvent?>
    implements IDisposable {
  Uri get url;

  Stream<T> get eventsStream;
}
