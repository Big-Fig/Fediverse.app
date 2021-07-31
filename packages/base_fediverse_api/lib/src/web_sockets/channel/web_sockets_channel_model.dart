import 'package:equatable/equatable.dart';

import '../../connection/connection_service.dart';
import '../../rest/rest_query_helper.dart';
import '../channel/web_sockets_channel_source.dart';
import '../channel/web_sockets_channel_source_impl.dart';
import '../listen_type/web_sockets_listen_type_model.dart';
import '../web_sockets_model.dart';
import 'package:flutter/foundation.dart';

typedef WebSocketsChannelEventCallback<T> = void Function(T event);

abstract class IWebSocketsChannelConfig<T extends WebSocketsEvent> {
  IWebSocketsChannelSource<T> createChannelSource();

  Uri calculateWebSocketsUrl();
}

abstract class WebSocketsChannelConfig<T extends WebSocketsEvent>
    extends Equatable implements IWebSocketsChannelConfig<T> {
  final Uri baseUrl;
  final Map<String, String?> queryArgs;

  T eventParser(Map<String, dynamic> json);

  // todo: connection service shouldnt be here
  final IConnectionService connectionService;

  WebSocketsChannelConfig({
    required this.connectionService,
    required this.baseUrl,
    required this.queryArgs,
  });

  @override
  IWebSocketsChannelSource<T> createChannelSource() => WebSocketsChannelSource(
        connectionService: connectionService,
        url: calculateWebSocketsUrl(),
        eventParser: eventParser,
      );

  @override
  Uri calculateWebSocketsUrl() {
    var queryArgsString = queryArgs.combineQueryArguments();

    var webSocketPath = baseUrl.toString() + '?$queryArgsString';
    // _logger.finest(() => 'calculateUrl $webSocketPath');

    return Uri.parse(webSocketPath);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [baseUrl, queryArgs];
}

class WebSocketChannelListener<T> {
  final WebSocketsListenType listenType;
  final WebSocketsChannelEventCallback<T> onEvent;

  WebSocketChannelListener({
    required this.listenType,
    required this.onEvent,
  });

  @override
  String toString() {
    return 'WebSocketChannelListener{'
        'listenType: $listenType, '
        'onEvent: $onEvent'
        '}';
  }
}
