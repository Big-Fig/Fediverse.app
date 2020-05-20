import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/websockets/websockets_channel.dart';
import 'package:fedi/websockets/websockets_channel_model.dart';
import 'package:fedi/websockets/websockets_model.dart';
import 'package:flutter/widgets.dart';

abstract class IWebSocketsService extends Disposable {
  IWebSocketsChannel<T> getOrCreateWebSocketsChannel<T extends WebSocketsEvent>(
      {@required IWebSocketsChannelConfig<T> config});
}
