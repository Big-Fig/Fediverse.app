import 'package:fedi/pleroma/websockets/pleroma_websockets_service_impl.dart';
import 'package:fedi/websockets/websockets_service.dart';
import 'package:fedi/websockets/websockets_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var host = "https://fedi.app";
  var wssHost = "wss://fedi.app/api/v1/streaming";
  var accessToken = "accessToken";

  IWebSocketsService webSocketsService;
  PleromaWebSocketsService pleromaWebSocketsService;

  setUp(() async {
    webSocketsService = WebSocketsService();

    pleromaWebSocketsService = PleromaWebSocketsService(
        webSocketsService: webSocketsService,
        baseUri: Uri.parse(host),
        accessToken: accessToken);
  });

  tearDown(() async {
    webSocketsService.dispose();
    pleromaWebSocketsService.dispose();
  });

  test('getHashtagChannel', () async {
    expect(
        pleromaWebSocketsService
            .getHashtagChannel(hashtag: "hashtag1", local: true)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=hashtag:local"
        "&tag=hashtag1");
    expect(
        pleromaWebSocketsService
            .getHashtagChannel(hashtag: "hashtag1", local: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=hashtag"
        "&tag=hashtag1");
  });

  test('getPublicChannel', () async {
    expect(
        pleromaWebSocketsService
            .getPublicChannel(local: true, onlyMedia: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=public:local");
    expect(
        pleromaWebSocketsService
            .getPublicChannel(local: false, onlyMedia: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=public");
    expect(
        pleromaWebSocketsService
            .getPublicChannel(local: true, onlyMedia: true)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=public:local:media");
    expect(
        pleromaWebSocketsService
            .getPublicChannel(local: false, onlyMedia: true)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=public:media");
  });

  test('getListChannel', () async {
    expect(
        pleromaWebSocketsService
            .getListChannel(listId: "list1")
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=list"
        "&list=list1");
  });
  test('getAccountChannel', () async {
    expect(
        pleromaWebSocketsService
            .getAccountChannel(accountId: "user1", notification: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=user"
        "&accountId=user1");
    expect(
        pleromaWebSocketsService
            .getAccountChannel(accountId: "user1", notification: true)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=user:notification"
        "&accountId=user1");
  });

  test('getAccountChannel', () async {
    expect(
        pleromaWebSocketsService
            .getMyAccountChannel( notification: false, chat: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=user");
    expect(
        pleromaWebSocketsService
            .getMyAccountChannel( notification: true, chat: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=user:notification");
  });
  test('getDirectChannel', () async {
    expect(
        pleromaWebSocketsService
            .getDirectChannel(accountId: "direct1")
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=direct"
        "&accountId=direct1");
  });
}
