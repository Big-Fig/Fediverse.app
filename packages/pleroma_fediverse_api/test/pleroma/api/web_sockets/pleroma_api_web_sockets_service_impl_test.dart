import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';

import 'pleroma_api_web_sockets_service_impl_test.mocks.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks([ConnectionService])
void main() {
  var host = 'https://fedi.app';
  var wssHost = 'wss://fedi.app/api/v1/streaming';
  var accessToken = 'accessToken';

  late IWebSocketsService webSocketsService;
  late PleromaApiWebSocketsService pleromaWebSocketsService;
  late MockConnectionService connectionServiceMock;

  setUp(() async {
    webSocketsService = WebSocketsService(
      configBloc: WebSocketsServiceConfigBloc(
        WebSocketsHandlingType.foregroundAndBackground,
      ),
    );

    connectionServiceMock = MockConnectionService();

    pleromaWebSocketsService = PleromaApiWebSocketsService(
      webSocketsService: webSocketsService,
      baseUri: Uri.parse(host),
      accessToken: accessToken,
      connectionService: connectionServiceMock,
    );
  });

  tearDown(() async {
    await webSocketsService.dispose();
    await pleromaWebSocketsService.dispose();
  });

  test('getHashtagChannel', () async {
    expect(
      pleromaWebSocketsService
          .getHashtagChannel(
            hashtag: 'hashtag1',
            local: true,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=hashtag:local'
      '&tag=hashtag1',
    );
    expect(
      pleromaWebSocketsService
          .getHashtagChannel(
            hashtag: 'hashtag1',
            local: false,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=hashtag'
      '&tag=hashtag1',
    );
  });

  test('getPublicChannel', () async {
    expect(
      pleromaWebSocketsService
          .getPublicChannel(
            onlyLocal: true,
            onlyMedia: false,
            onlyFromInstance: null,
            onlyRemote: null,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=public:local',
    );
    expect(
      pleromaWebSocketsService
          .getPublicChannel(
            onlyLocal: false,
            onlyMedia: false,
            onlyFromInstance: null,
            onlyRemote: null,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=public',
    );
    expect(
      pleromaWebSocketsService
          .getPublicChannel(
            onlyLocal: true,
            onlyMedia: true,
            onlyFromInstance: null,
            onlyRemote: null,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=public:local:media',
    );
    expect(
      pleromaWebSocketsService
          .getPublicChannel(
            onlyLocal: false,
            onlyMedia: true,
            onlyFromInstance: null,
            onlyRemote: null,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=public:media',
    );

    expect(
      pleromaWebSocketsService
          .getPublicChannel(
            onlyLocal: false,
            onlyMedia: true,
            onlyFromInstance: null,
            onlyRemote: true,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=public:remote:media',
    );
    expect(
      pleromaWebSocketsService
          .getPublicChannel(
            onlyLocal: false,
            onlyMedia: true,
            onlyFromInstance: 'lain.com',
            onlyRemote: true,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=public:remote:media?instance=lain.com',
    );
  });

  test('getListChannel', () async {
    expect(
      pleromaWebSocketsService
          .getListChannel(
            listId: 'list1',
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=list'
      '&list=list1',
    );
  });
  test('getAccountChannel', () async {
    expect(
      pleromaWebSocketsService
          .getAccountChannel(
            accountId: 'user1',
            notification: false,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=user'
      '&accountId=user1',
    );
    expect(
      pleromaWebSocketsService
          .getAccountChannel(
            accountId: 'user1',
            notification: true,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=user:notification'
      '&accountId=user1',
    );
  });

  test('getAccountChannel', () async {
    expect(
      pleromaWebSocketsService
          .getMyAccountChannel(
            notification: false,
            chat: false,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=user',
    );
    expect(
      pleromaWebSocketsService
          .getMyAccountChannel(
            notification: true,
            chat: false,
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=user:notification',
    );
  });
  test('getDirectChannel', () async {
    expect(
      pleromaWebSocketsService
          .getDirectChannel(
            accountId: 'direct1',
          )
          .config
          .calculateWebSocketsUrl()
          .toString(),
      '$wssHost?access_token=$accessToken&stream=direct'
      '&accountId=direct1',
    );
  });
}
