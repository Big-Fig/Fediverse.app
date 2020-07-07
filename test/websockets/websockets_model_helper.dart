import 'package:fedi/websockets/websockets_channel_model.dart';
import 'package:fedi/websockets/websockets_model.dart';
import 'package:flutter/widgets.dart';

class TestWebSocketsChannelConfig extends WebSocketsChannelConfig {
  TestWebSocketsChannelConfig(
      {@required Uri baseUrl, @required Map<String, String> queryArgs})
      : super(baseUrl: baseUrl, queryArgs: queryArgs, connectionService: null);

  @override
  WebSocketsEvent eventParser(Map<String, dynamic> json) {
    return null;
  }
}

class TestWebSocketEvent extends WebSocketsEvent {
  final String seed;

  TestWebSocketEvent(this.seed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestWebSocketEvent &&
          runtimeType == other.runtimeType &&
          seed == other.seed;

  @override
  int get hashCode => seed.hashCode;

  @override
  String toString() {
    return 'TestWebSocketEvent{seed: $seed}';
  }
}
