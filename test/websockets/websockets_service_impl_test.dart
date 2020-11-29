import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:fedi/web_sockets/service/config/web_sockets_service_config_bloc_impl.dart';
import 'package:fedi/web_sockets/service/web_sockets_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import 'websockets_model_helper.dart';

void main() {
  WebSocketsService webSocketsService;
  setUp(() {
    webSocketsService = WebSocketsService(
      configBloc: WebSocketsServiceConfigBloc(
        WebSocketsHandlingType.foregroundAndBackground,
      ),
    );
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
    );

    expect(webSocketsService.urlToChannel.length, 1);
    // diff query arg
    webSocketsService.getOrCreateWebSocketsChannel(
      config: TestWebSocketsChannelConfig(
        queryArgs: {"arg": "newValue"},
        baseUrl: Uri.parse("wss://fedi.app"),
      ),
    );

    expect(webSocketsService.urlToChannel.length, 2);

    // diff baseUrl
    webSocketsService.getOrCreateWebSocketsChannel(
      config: TestWebSocketsChannelConfig(
        queryArgs: {"arg": "newValue"},
        baseUrl: Uri.parse("wss://fedi_2.app"),
      ),
    );

    expect(webSocketsService.urlToChannel.length, 3);
  });
}
