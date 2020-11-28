import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:fedi/web_sockets/web_sockets_service_impl.dart';
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
        queryArgs: {"arg": "value"},
        baseUrl: Uri.parse("wss://fedi.app"),
      ),
      listenType: WebSocketsListenType.foreground,
    );
    expect(webSocketsService.urlToChannel.length, 1);

    // same
    webSocketsService.getOrCreateWebSocketsChannel(
      config: TestWebSocketsChannelConfig(
        queryArgs: {"arg": "value"},
        baseUrl: Uri.parse(
          "wss://fedi.app",
        ),
      ),
      listenType: WebSocketsListenType.foreground,
    );

    expect(webSocketsService.urlToChannel.length, 1);
    // diff query arg
    webSocketsService.getOrCreateWebSocketsChannel(
      config: TestWebSocketsChannelConfig(
        queryArgs: {"arg": "newValue"},
        baseUrl: Uri.parse("wss://fedi.app"),
      ),
      listenType: WebSocketsListenType.foreground,
    );

    expect(webSocketsService.urlToChannel.length, 2);

    // diff baseUrl
    webSocketsService.getOrCreateWebSocketsChannel(
      config: TestWebSocketsChannelConfig(
        queryArgs: {"arg": "newValue"},
        baseUrl: Uri.parse("wss://fedi_2.app"),
      ),
      listenType: WebSocketsListenType.foreground,
    );

    expect(webSocketsService.urlToChannel.length, 3);
  });
}
