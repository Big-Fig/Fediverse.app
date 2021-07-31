import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../websockets_model_test_impl.dart';
import 'web_sockets_channel_impl_test.mocks.dart';
import 'web_sockets_channel_model_test_impl.dart';
import 'web_sockets_channel_source_mock.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
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
      queryArgs: {'test': 'test'},
      baseUrl: Uri.parse('wss://fedi.app/'),
      sourceCreator: () => source,
    );

    source = WebSocketsChannelSourceMock<WebSocketEventTest>(
      url: Uri.parse(
        'wss://fedi1.app?arg=value',
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
    var event1 = WebSocketEventTest('test1');
    var event2 = WebSocketEventTest('test2');

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

    expect(
      listenedValue1,
      null,
    );

    source.addEvent(event1);

    await ListenerTestHelper.waitForData(() => listenedValue1);
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
    listenedValue1 = null;
    listenedValue2 = null;

    source.addEvent(event2);

    await ListenerTestHelper.waitForData(() => listenedValue1);
    await ListenerTestHelper.waitForData(() => listenedValue2);

    expect(
      listenedValue1,
      event2,
    );
    expect(
      listenedValue2,
      event2,
    );

    await subscriptionDisposable1.dispose();

    listenedValue1 = null;
    listenedValue2 = null;

    source.addEvent(event1);

    expect(
      listenedValue1,
      null,
    );
    expect(
      listenedValue2,
      null,
    );

    await subscriptionDisposable2.dispose();
  });
}

typedef DataChecker<T> = T Function();

class ListenerTestHelper {
  static Future<T> waitForData<T>(
    DataChecker<T?> dataChecker, {
    Duration reCheckInterval = const Duration(milliseconds: 10),
    Duration timeout = const Duration(seconds: 1),
  }) async {
    final startData = dataChecker();

    if (startData != null) {
      return startData;
    }

    var start = DateTime.now();

    return _wait(
      reCheckInterval: reCheckInterval,
      start: start,
      dataChecker: dataChecker,
      timeout: timeout,
    );
  }

  static Future<T> _wait<T>({
    required Duration reCheckInterval,
    required DateTime start,
    required DataChecker<T?> dataChecker,
    required Duration timeout,
  }) {
    return Future.delayed(
      reCheckInterval,
      () {
        var currentDiff = DateTime.now().difference(start).abs();

        final currentData = dataChecker();

        if (currentData != null) {
          return currentData;
        }

        if (currentDiff > timeout) {
          throw Exception('Required data not found after $timeout');
        } else {
          return _wait(
            reCheckInterval: reCheckInterval,
            start: start,
            dataChecker: dataChecker,
            timeout: timeout,
          );
        }
      },
    );
  }

  static Future waitToExecuteRxCallbacks({
    Duration duration = const Duration(milliseconds: 1),
  }) =>
      Future.delayed(duration);
}
