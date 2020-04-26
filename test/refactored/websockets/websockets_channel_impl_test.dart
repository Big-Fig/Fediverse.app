import 'package:fedi/refactored/websockets/websockets_channel_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'websockets_channel_config_mock.dart';
import 'websockets_channel_source_mock.dart';
import 'websockets_model_helper.dart';

void main() {
  WebSocketsChannelConfigMock<TestWebSocketEvent> config;
  WebSocketsChannel<TestWebSocketEvent> channel;
  WebSocketsChannelSourceMock<TestWebSocketEvent> source;
  setUp(() {
    config = WebSocketsChannelConfigMock();
    source = WebSocketsChannelSourceMock<TestWebSocketEvent>(
        url: Uri.parse("wss://fedi1"
            ".app?arg=value"));
    when(config.createChannelSource()).thenReturn(source);
    channel = WebSocketsChannel<TestWebSocketEvent>(config: config);
  });
  tearDown(() {
    channel.dispose();
  });

  test('config', () {
    expect(channel.config, config);
  });
  test('isPaused', () async {
    expect(channel.isPaused, true);
    var subscription = channel.eventsStream.listen((_) {});
    expect(channel.isPaused, false);

    await subscription.cancel();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(channel.isPaused, true);
  });
  test('eventsStream', () async {
    var event1 = TestWebSocketEvent("test1");
    var event2 = TestWebSocketEvent("test2");

    var listenedValue1;
    var listenedValue2;
    var subscription1 = channel.eventsStream.listen((value) {
      listenedValue1 = value;
    });

    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(listenedValue1, null);

    source.addEvent(event1);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue1, event1);
    var subscription2 = channel.eventsStream.listen((value) {
      listenedValue2 = value;
    });
    expect(listenedValue2, null);

    source.addEvent(event2);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue1, event2);
    expect(listenedValue2, event2);

    subscription1.cancel();

    source.addEvent(event1);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue1, event2);
    expect(listenedValue2, event1);

    subscription2.cancel();
  });
}
