import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/pleroma/web_sockets/pleroma_web_sockets_model.dart';
import 'package:fedi/pleroma/web_sockets/pleroma_web_sockets_service.dart';
import 'package:fedi/web_sockets/listen_type/web_sockets_listen_type_model.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';
import 'package:fedi/web_sockets/web_sockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

class PleromaWebSocketsService extends IPleromaWebSocketsService {
  static final _relativePath = "/api/v1/streaming";
  final IWebSocketsService webSocketsService;

  final Uri baseUri;
  final String accessToken;
  final IConnectionService connectionService;

  PleromaWebSocketsService({
    @required this.webSocketsService,
    @required this.connectionService,
    @required this.baseUri,
    @required this.accessToken,
  });

  IWebSocketsChannel<PleromaWebSocketsEvent> getOrCreateNewChannel({
    @required String stream,
    Map<String, String> queryArgs,
    @required WebSocketsListenType listenType,
  }) {
    var webSocketsScheme = mapHttpToWebSocketsScheme(baseUri.scheme);
    var host = baseUri.host;
    var baseUrl =
        Uri(scheme: webSocketsScheme, host: host, path: _relativePath);
    return webSocketsService.getOrCreateWebSocketsChannel(
      listenType: listenType,
      config: PleromaWebSocketsChannelConfig(
        connectionService: connectionService,
        baseUrl: baseUrl,
        queryArgs: {
          "access_token": accessToken,
          "stream": stream,
          ...(queryArgs ?? {})
        },
      ),
    );
  }

  String mapHttpToWebSocketsScheme(String scheme) {
    switch (scheme) {
      case "http":
        return "ws";
        break;
      case "https":
        return "wss";
        break;
    }
    throw "Invalid http protocol $scheme";
  }

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getHashtagChannel({
    @required String hashtag,
    @required bool local,
    @required WebSocketsListenType listenType,
  }) =>
      getOrCreateNewChannel(
          listenType: listenType,
          stream: local ? "hashtag:local" : "hashtag",
          queryArgs: {"tag": hashtag});

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getListChannel({
    @required String listId,
    @required WebSocketsListenType listenType,
  }) =>
      getOrCreateNewChannel(
        listenType: listenType,
        stream: "list",
        queryArgs: {"list": listId},
      );

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getPublicChannel({
    @required bool local,
    @required bool onlyMedia,
    @required WebSocketsListenType listenType,
  }) {
    var stream = local ? "public:local" : "public";
    if (onlyMedia) {
      stream += ":media";
    }
    return getOrCreateNewChannel(
      stream: stream,
      listenType: listenType,
    );
  }

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getAccountChannel({
    @required String accountId,
    @required bool notification,
    @required WebSocketsListenType listenType,
  }) {
    assert(accountId != null);
    return getOrCreateNewChannel(
        listenType: listenType,
        stream: notification ? "user:notification" : "user",
        queryArgs: {"accountId": accountId});
  }

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getMyAccountChannel({
    @required bool notification,
    @required bool chat,
    @required WebSocketsListenType listenType,
  }) {
    assert(!(notification == true && chat == true));
    return getOrCreateNewChannel(
        listenType: listenType,
        stream: notification
            ? "user:notification"
            : chat
                ? "user:pleroma_chat"
                : "user");
  }

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getDirectChannel({
    @required String accountId,
    @required WebSocketsListenType listenType,
  }) {
    Map<String, String> queryArgs = {};
    if (accountId != null) {
      queryArgs.addAll({"accountId": accountId});
    }
    return getOrCreateNewChannel(
      stream: "direct",
      queryArgs: queryArgs,
      listenType: listenType,
    );
  }

  WebSocketsEvent eventParser(Map<String, dynamic> json) =>
      PleromaWebSocketsEvent.fromJson(json);
}
