import 'package:fedi/refactored/websockets/websockets_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'websockets_model_helper.dart';

void main() {
  WebSocketsService webSocketsService;
  setUp(() {
    webSocketsService = WebSocketsService();
  });

  tearDown(() {
    webSocketsService.dispose();
  });

  test('getOrCreateWebSocketsChannel', () {
    webSocketsService.getOrCreateWebSocketsChannel(
        config: TestWebSocketsChannelConfig(
            queryArgs: {"arg": "value"}, baseUrl: Uri.parse("wss://fedi.app")));
    expect(webSocketsService.urlToChannel.length, 1);

    // same
    webSocketsService.getOrCreateWebSocketsChannel(
        config: TestWebSocketsChannelConfig(
            queryArgs: {"arg": "value"}, baseUrl: Uri.parse("wss://fedi.app")));

    expect(webSocketsService.urlToChannel.length, 1);
    // diff query arg
    webSocketsService.getOrCreateWebSocketsChannel(
        config: TestWebSocketsChannelConfig(
            queryArgs: {"arg": "newValue"},
            baseUrl: Uri.parse("wss://fedi.app")));

    expect(webSocketsService.urlToChannel.length, 2);

    // diff baseUrl
    webSocketsService.getOrCreateWebSocketsChannel(
        config: TestWebSocketsChannelConfig(
            queryArgs: {"arg": "newValue"},
            baseUrl: Uri.parse("wss://fedi2.app")));

    expect(webSocketsService.urlToChannel.length, 3);
  });
}
