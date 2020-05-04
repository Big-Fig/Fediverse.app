import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:fedi/refactored/websockets/websockets_channel.dart';
import 'package:fedi/refactored/websockets/websockets_channel_model.dart';
import 'package:fedi/refactored/websockets/websockets_model.dart';
import 'package:flutter/widgets.dart';

abstract class IWebSocketsService extends Disposable {
  IWebSocketsChannel<T> getOrCreateWebSocketsChannel<T extends WebSocketsEvent>(
      {@required IWebSocketsChannelConfig<T> config});
}
