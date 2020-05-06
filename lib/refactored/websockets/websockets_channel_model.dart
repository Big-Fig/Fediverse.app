import 'package:fedi/refactored/websockets/websockets_channel_source.dart';
import 'package:fedi/refactored/websockets/websockets_channel_source_impl.dart';
import 'package:fedi/refactored/websockets/websockets_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("websockets_channel_model.dart");

abstract class IWebSocketsChannelConfig<T extends WebSocketsEvent> {
  IWebSocketsChannelSource<T> createChannelSource();

  Uri calculateWebSocketsUrl();
}

abstract class WebSocketsChannelConfig<T extends WebSocketsEvent>
    implements IWebSocketsChannelConfig<T> {
  final Uri baseUrl;
  final Map<String, String> queryArgs;

  T eventParser(Map<String, dynamic> json);

  WebSocketsChannelConfig({@required this.baseUrl, @required this.queryArgs});

  @override
  IWebSocketsChannelSource<T> createChannelSource() => WebSocketsChannelSource(
      url: calculateWebSocketsUrl(), eventParser: eventParser);

  @override
  Uri calculateWebSocketsUrl() {
    var queryArgsString = queryArgs.entries
        .map((entry) => "${entry.key}=${entry.value}")
        .join("&");

    var webSocketPath = baseUrl.toString() + "?$queryArgsString";
    _logger.finest(() => "calculateUrl $webSocketPath");
    return Uri.parse(webSocketPath);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WebSocketsChannelConfig &&
          runtimeType == other.runtimeType &&
          baseUrl == other.baseUrl &&
          queryArgs == other.queryArgs;

  @override
  int get hashCode => baseUrl.hashCode ^ queryArgs.hashCode;

  @override
  String toString() {
    return 'WebSocketsChannelConfig{baseUrl: $baseUrl, queryArgs: $queryArgs}';
  }
}
