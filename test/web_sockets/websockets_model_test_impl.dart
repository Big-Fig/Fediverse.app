import 'package:fedi/web_sockets/web_sockets_model.dart';

class WebSocketEventTest extends WebSocketsEvent {
  final String seed;

  WebSocketEventTest(this.seed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebSocketEventTest &&
          runtimeType == other.runtimeType &&
          seed == other.seed;

  @override
  int get hashCode => seed.hashCode;

  @override
  String toString() {
    return 'TestWebSocketEvent{seed: $seed}';
  }
}
