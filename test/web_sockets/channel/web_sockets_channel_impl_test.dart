import 'package:fedi/connection/connection_service_impl.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_impl.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:fedi/web_sockets/service/config/web_sockets_service_config_bloc_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../websockets_model_test_impl.dart';
import 'web_sockets_channel_impl_test.mocks.dart';
import 'web_sockets_channel_model_test_impl.dart';
import 'web_sockets_channel_source_mock.dart';

@GenerateMocks([ConnectionService])
void main() {
  late WebSocketsChannelConfigTest config;
  late WebSocketsChannel<WebSocketEventTest> channel;
  late WebSocketsChannelSourceMock<WebSocketEventTest> source;
  late MockConnectionService connectionService;

  setUp(() {
    connectionService = MockConnectionService();

    when(connectionService.isConnected).thenReturn(true);
    when(connectionService.isConnectedStream).thenAnswer(
      (_) => Stream<bool>.value(true),
    );

    config = WebSocketsChannelConfigTest(
      connectionService: connectionService,
      queryArgs: {"test": "test"},
      baseUrl: Uri.parse("wss://fedi.app/"),
      sourceCreator: () => source,
    );

    source = WebSocketsChannelSourceMock<WebSocketEventTest>(
      url: Uri.parse(
        "wss://fedi1.app?arg=value",
      ),
    );

    when(connectionService.isConnectedStream).thenAnswer(
      (_) => Stream<bool>.value(true),
    );

    channel = WebSocketsChannel<WebSocketEventTest>(
      config: config,
      serviceConfigBloc: WebSocketsServiceConfigBloc(
        WebSocketsHandlingType.foregroundAndBackground,
      ),
    );
  });

  tearDown(() {
    channel.dispose();
  });

  test('config', () {
    expect(
      channel.config,
      config,
    );
  });

  test('eventsStream', () async {
    var event1 = WebSocketEventTest("test1");
    var event2 = WebSocketEventTest("test2");

    var listenedValue1;
    var listenedValue2;
    var subscriptionDisposable1 = channel.listenForEvents(
      listener: WebSocketChannelListener<WebSocketEventTest>(
        listenType: WebSocketsListenType.foreground,
        onEvent: (value) {
          listenedValue1 = value;
        },
      ),
    );

    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      listenedValue1,
      null,
    );

    source.addEvent(event1);

    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue1,
      event1,
    );
    var subscriptionDisposable2 = channel.listenForEvents(
      listener: WebSocketChannelListener<WebSocketEventTest>(
        listenType: WebSocketsListenType.foreground,
        onEvent: (value) {
          listenedValue2 = value;
        },
      ),
    );
    expect(
      listenedValue2,
      null,
    );

    source.addEvent(event2);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue1,
      event2,
    );
    expect(
      listenedValue2,
      event2,
    );

    await subscriptionDisposable1.dispose();

    source.addEvent(event1);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue1,
      event2,
    );
    expect(
      listenedValue2,
      event1,
    );

    await subscriptionDisposable2.dispose();
  });
}
