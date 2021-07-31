import 'package:base_fediverse_api/base_fediverse_api.dart';

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
      WebSocketEventTest('seed');
}
