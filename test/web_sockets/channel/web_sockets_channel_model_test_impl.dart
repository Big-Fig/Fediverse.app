import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_model.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel_source.dart';

import '../websockets_model_test_impl.dart';

class WebSocketsChannelConfigTest
    extends WebSocketsChannelConfig<WebSocketEventTest> {
  final IWebSocketsChannelSource<WebSocketEventTest> Function() sourceCreator;

  WebSocketsChannelConfigTest({
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
  IWebSocketsChannelSource<WebSocketEventTest> createChannelSource() =>
      sourceCreator();

  @override
  WebSocketEventTest eventParser(Map<String, dynamic> json) =>
      WebSocketEventTest("seed");
}
