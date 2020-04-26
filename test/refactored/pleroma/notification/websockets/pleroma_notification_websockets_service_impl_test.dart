import 'package:fedi/refactored/pleroma/notification/websockets/pleroma_notification_websockets_service_impl.dart';
import 'package:fedi/refactored/websockets/websockets_service.dart';
import 'package:fedi/refactored/websockets/websockets_service_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var host = "https://fedi.app";
  var wssHost = "wss://fedi.app/api/v1/streaming";
  var accessToken = "accessToken";

  IWebSocketsService webSocketsService;
  PleromaNotificationWebSocketsService pleromaNotificationWebSocketsService;

  setUp(() async {
    webSocketsService = WebSocketsService();

    pleromaNotificationWebSocketsService = PleromaNotificationWebSocketsService(
        webSocketsService: webSocketsService,
        baseUri: Uri.parse(host),
        accessToken: accessToken);
  });

  tearDown(() async {
    webSocketsService.dispose();
    pleromaNotificationWebSocketsService.dispose();
  });

  test('getHashtagChannel', () async {
    expect(
        pleromaNotificationWebSocketsService
            .getHashtagChannel(hashtag: "hashtag1", local: true)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=hashtag:local"
        "&tag=hashtag1");
    expect(
        pleromaNotificationWebSocketsService
            .getHashtagChannel(hashtag: "hashtag1", local: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=hashtag"
        "&tag=hashtag1");
  });

  test('getPublicChannel', () async {
    expect(
        pleromaNotificationWebSocketsService
            .getPublicChannel(local: true, onlyMedia: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=public:local");
    expect(
        pleromaNotificationWebSocketsService
            .getPublicChannel(local: false, onlyMedia: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=public");
    expect(
        pleromaNotificationWebSocketsService
            .getPublicChannel(local: true, onlyMedia: true)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=public:local:media");
    expect(
        pleromaNotificationWebSocketsService
            .getPublicChannel(local: false, onlyMedia: true)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=public:media");
  });

  test('getListChannel', () async {
    expect(
        pleromaNotificationWebSocketsService
            .getListChannel(listId: "list1")
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=list"
        "&list=list1");
  });
  test('getUserChannel', () async {
    expect(
        pleromaNotificationWebSocketsService
            .getUserChannel(accountId: "user1", notification: false)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=user"
        "&accountId=user1");
    expect(
        pleromaNotificationWebSocketsService
            .getUserChannel(accountId: "user1", notification: true)
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=user:notification"
        "&accountId=user1");
  });
  test('getDirectChannel', () async {
    expect(
        pleromaNotificationWebSocketsService
            .getDirectChannel(accountId: "direct1")
            .config
            .calculateWebSocketsUrl()
            .toString(),
        "$wssHost?access_token=$accessToken&stream=direct"
        "&accountId=direct1");
  });
}
