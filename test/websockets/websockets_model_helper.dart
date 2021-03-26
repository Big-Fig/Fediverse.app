import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_source.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';

class TestWebSocketsChannelConfig extends WebSocketsChannelConfig<TestWebSocketEvent> {

  final IWebSocketsChannelSource<TestWebSocketEvent> Function() sourceCreator;

  TestWebSocketsChannelConfig({
    required Uri baseUrl,
    required Map<String, String> queryArgs,
    required IConnectionService connectionService,
    required this.sourceCreator,
  }) : super(
          baseUrl: baseUrl,
          queryArgs: queryArgs,
          connectionService: connectionService,
        );

  @override
  IWebSocketsChannelSource<TestWebSocketEvent> createChannelSource() => sourceCreator();

  @override
  TestWebSocketEvent eventParser(Map<String, dynamic> json) =>
      TestWebSocketEvent("seed");
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
