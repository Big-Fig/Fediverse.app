import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import '../web_sockets_model.dart';

abstract class IWebSocketsChannelSource<T extends WebSocketsEvent?>
    implements IDisposable {
  Uri get url;

  Stream<T> get eventsStream;
}
