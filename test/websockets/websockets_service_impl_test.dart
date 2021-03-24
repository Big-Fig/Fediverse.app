import 'package:fedi/connection/connection_service_impl.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:fedi/web_sockets/service/config/web_sockets_service_config_bloc_impl.dart';
import 'package:fedi/web_sockets/service/web_sockets_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../pleroma/websockets/pleroma_websockets_service_impl_test.mocks.dart';
import 'websockets_model_helper.dart';

@GenerateMocks([
  ConnectionService,
])
void main() {
  late WebSocketsService webSocketsService;

  late MockConnectionService connectionServiceMock;
  setUp(() {
    connectionServiceMock = MockConnectionService();

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
        connectionService: connectionServiceMock,
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
        connectionService: connectionServiceMock,
      ),
    );

    expect(webSocketsService.urlToChannel.length, 1);
    // diff query arg
    webSocketsService.getOrCreateWebSocketsChannel(
      config: TestWebSocketsChannelConfig(
        queryArgs: {"arg": "newValue"},
        baseUrl: Uri.parse("wss://fedi.app"),
        connectionService: connectionServiceMock,
      ),
    );

    expect(webSocketsService.urlToChannel.length, 2);

    // diff baseUrl
    webSocketsService.getOrCreateWebSocketsChannel(
      config: TestWebSocketsChannelConfig(
        queryArgs: {"arg": "newValue"},
        baseUrl: Uri.parse("wss://fedi_2.app"),
        connectionService: connectionServiceMock,
      ),
    );

    expect(webSocketsService.urlToChannel.length, 3);
  });
}
