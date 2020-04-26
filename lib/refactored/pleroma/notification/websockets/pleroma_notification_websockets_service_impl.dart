import 'package:fedi/refactored/pleroma/notification/websockets/pleroma_notification_websockets_model.dart';
import 'package:fedi/refactored/pleroma/notification/websockets/pleroma_notification_websockets_service.dart';
import 'package:fedi/refactored/websockets/websockets_channel_impl.dart';
import 'package:fedi/refactored/websockets/websockets_channel_model.dart';
import 'package:fedi/refactored/websockets/websockets_model.dart';
import 'package:fedi/refactored/websockets/websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

class PleromaNotificationWebSocketsService
    extends IPleromaNotificationWebSocketsService {
  static final _relativePath = "/api/v1/streaming";
  final IWebSocketsService webSocketsService;

  final Uri baseUri;
  final String accessToken;

  PleromaNotificationWebSocketsService({
    @required this.webSocketsService,
    @required this.baseUri,
    @required this.accessToken,
  });

  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getOrCreateNewChannel(
      {@required String stream, Map<String, String> queryArgs}) {
    var webSocketsScheme = mapHttpToWebSocketsScheme(baseUri.scheme);
    var host = baseUri.host;
    var baseUrl =
        Uri(scheme: webSocketsScheme, host: host, path: _relativePath);
    return webSocketsService.getOrCreateWebSocketsChannel(
        config: PleromaNotificationWebSocketsChannelConfig(
      baseUrl: baseUrl,
      queryArgs: {
        "access_token": accessToken,
        "stream": stream,
        ...(queryArgs ?? {})
      },
    ));
  }

  mapHttpToWebSocketsScheme(String scheme) {
    switch (scheme) {
      case "http":
        return "ws";
        break;
      case "https":
        return "wss";
        break;
    }
    throw "Invalid http protocal $scheme";
  }

  @override
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getHashtagChannel(
          {@required String hashtag, @required bool local}) =>
      getOrCreateNewChannel(
          stream: local ? "hashtag:local" : "hashtag",
          queryArgs: {"tag": hashtag});

  @override
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getListChannel(
          {@required String listId}) =>
      getOrCreateNewChannel(stream: "list", queryArgs: {"list": listId});

  @override
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getPublicChannel(
      {@required bool local, @required onlyMedia}) {
    var stream = local ? "public:local" : "public";
    if (onlyMedia) {
      stream += ":media";
    }
    return getOrCreateNewChannel(stream: stream);
  }

  @override
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getUserChannel(
          {@required String accountId, @required bool notification}) =>
      getOrCreateNewChannel(
          stream: notification ? "user:notification" : "user",
          queryArgs: {"accountId": accountId});

  @override
  WebSocketsChannel<PleromaNotificationWebSocketsEvent> getDirectChannel(
          {@required String accountId}) =>
      getOrCreateNewChannel(
          stream: "direct", queryArgs: {"accountId": accountId});

  WebSocketsEvent eventParser(Map<String, dynamic> json) =>
      PleromaNotificationWebSocketsEvent.fromJson(json);
}
