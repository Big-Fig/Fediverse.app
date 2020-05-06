import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_model.dart';
import 'package:fedi/refactored/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:fedi/refactored/websockets/websockets_channel.dart';
import 'package:fedi/refactored/websockets/websockets_model.dart';
import 'package:fedi/refactored/websockets/websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

class PleromaWebSocketsService extends IPleromaWebSocketsService {
  static final _relativePath = "/api/v1/streaming";
  final IWebSocketsService webSocketsService;

  final Uri baseUri;
  final String accessToken;

  PleromaWebSocketsService({
    @required this.webSocketsService,
    @required this.baseUri,
    @required this.accessToken,
  });

  IWebSocketsChannel<PleromaWebSocketsEvent> getOrCreateNewChannel(
      {@required String stream, Map<String, String> queryArgs}) {
    var webSocketsScheme = mapHttpToWebSocketsScheme(baseUri.scheme);
    var host = baseUri.host;
    var baseUrl =
        Uri(scheme: webSocketsScheme, host: host, path: _relativePath);
    return webSocketsService.getOrCreateWebSocketsChannel(
        config: PleromaWebSocketsChannelConfig(
      baseUrl: baseUrl,
      queryArgs: {
        "access_token": accessToken,
        "stream": stream,
        ...(queryArgs ?? {})
      },
    ));
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
    throw "Invalid http protocal $scheme";
  }

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getHashtagChannel(
          {@required String hashtag, @required bool local}) =>
      getOrCreateNewChannel(
          stream: local ? "hashtag:local" : "hashtag",
          queryArgs: {"tag": hashtag});

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getListChannel(
          {@required String listId}) =>
      getOrCreateNewChannel(stream: "list", queryArgs: {"list": listId});

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getPublicChannel(
      {@required bool local, @required bool onlyMedia}) {
    var stream = local ? "public:local" : "public";
    if (onlyMedia) {
      stream += ":media";
    }
    return getOrCreateNewChannel(stream: stream);
  }

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getAccountChannel(
      {@required String accountId, @required bool notification}) {
    assert(accountId != null);
    return getOrCreateNewChannel(
        stream: notification ? "user:notification" : "user",
        queryArgs: {"accountId": accountId});
  }

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getMyAccountChannel(
          {@required bool notification}) =>
      getOrCreateNewChannel(
          stream: notification ? "user:notification" : "user");

  @override
  IWebSocketsChannel<PleromaWebSocketsEvent> getDirectChannel(
      {@required String accountId}) {
    Map<String, String> queryArgs = {};
    if (accountId != null) {
      queryArgs.addAll({"accountId": accountId});
    }
    return getOrCreateNewChannel(stream: "direct", queryArgs: queryArgs);
  }

  WebSocketsEvent eventParser(Map<String, dynamic> json) =>
      PleromaWebSocketsEvent.fromJson(json);
}
