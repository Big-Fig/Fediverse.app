import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/pleroma/api/web_sockets/pleroma_api_web_sockets_model.dart';
import 'package:fedi/pleroma/api/web_sockets/pleroma_api_web_sockets_service.dart';
import 'package:fedi/web_sockets/channel/web_sockets_channel.dart';
import 'package:fedi/web_sockets/service/web_sockets_service.dart';
import 'package:fedi/web_sockets/web_sockets_model.dart';
import 'package:path/path.dart' as path;

var urlPath = path.posix;

class PleromaApiWebSocketsService extends IPleromaApiWebSocketsService {
  static const _relativePath = '/api/v1/streaming';
  final IWebSocketsService? webSocketsService;

  final Uri baseUri;
  final String accessToken;
  final IConnectionService connectionService;

  PleromaApiWebSocketsService({
    required this.webSocketsService,
    required this.connectionService,
    required this.baseUri,
    required this.accessToken,
  });

  IWebSocketsChannel<PleromaApiWebSocketsEvent> getOrCreateNewChannel({
    required String stream,
    Map<String, String>? queryArgs,
  }) {
    var webSocketsScheme = mapHttpToWebSocketsScheme(baseUri.scheme);
    var host = baseUri.host;
    var baseUrl = Uri(
      scheme: webSocketsScheme,
      host: host,
      path: _relativePath,
    );

    return webSocketsService!.getOrCreateWebSocketsChannel(
      config: PleromaApiWebSocketsChannelConfig(
        connectionService: connectionService,
        baseUrl: baseUrl,
        queryArgs: {
          'access_token': accessToken,
          'stream': stream,
          ...(queryArgs ?? {}),
        },
      ),
    );
  }

  String mapHttpToWebSocketsScheme(String scheme) {
    switch (scheme) {
      case 'http':
        return 'ws';
      case 'https':
        return 'wss';
    }
    throw 'Invalid http protocol $scheme';
  }

  @override
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getHashtagChannel({
    required String hashtag,
    required bool? local,
  }) =>
      getOrCreateNewChannel(
        stream: local! ? 'hashtag:local' : 'hashtag',
        queryArgs: {'tag': hashtag},
      );

  @override
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getListChannel({
    required String listId,
  }) =>
      getOrCreateNewChannel(
        stream: 'list',
        queryArgs: {'list': listId},
      );

  @override
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getPublicChannel({
    required bool? onlyLocal,
    required bool? onlyRemote,
    required bool? onlyMedia,
    required String? onlyFromInstance,
  }) {
    var stream = 'public';

    assert(
      !(onlyLocal == true && onlyRemote == true),
      'it is not possible to set onlyLocal and onlyRemote at same time',
    );

    if (onlyFromInstance?.isNotEmpty == true) {
      assert(
        onlyRemote == true,
        'onlyRemote should be true if instance != null',
      );
    }

    if (onlyLocal == true) {
      stream += ':local';
    }
    if (onlyRemote == true) {
      stream += ':remote';
    }
    if (onlyMedia == true) {
      stream += ':media';
    }
    if (onlyFromInstance != null) {
      stream += '?instance=$onlyFromInstance';
    }

    return getOrCreateNewChannel(
      stream: stream,
    );
  }

  @override
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getAccountChannel({
    required String accountId,
    required bool notification,
  }) {
    assert(accountId.isNotEmpty);

    return getOrCreateNewChannel(
      stream: notification ? 'user:notification' : 'user',
      queryArgs: {'accountId': accountId},
    );
  }

  @override
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getMyAccountChannel({
    required bool notification,
    required bool chat,
  }) {
    assert(!(notification && chat));

    return getOrCreateNewChannel(
      stream: notification
          ? 'user:notification'
          : chat
              ? 'user:pleroma_chat'
              : 'user',
    );
  }

  @override
  IWebSocketsChannel<PleromaApiWebSocketsEvent> getDirectChannel({
    required String? accountId,
  }) {
    var queryArgs = <String, String>{};
    if (accountId != null) {
      queryArgs.addAll({'accountId': accountId});
    }

    return getOrCreateNewChannel(
      stream: 'direct',
      queryArgs: queryArgs,
    );
  }

  WebSocketsEvent eventParser(Map<String, dynamic> json) =>
      PleromaApiWebSocketsEvent.fromJson(json);
}
