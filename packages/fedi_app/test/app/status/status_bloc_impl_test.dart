// ignore_for_file: prefer_const_constructors

import 'package:fedi_app/app/account/repository/account_repository.dart';
import 'package:fedi_app/app/account/repository/account_repository_impl.dart';
import 'package:fedi_app/app/database/app_database.dart';
import 'package:fedi_app/app/emoji/text/emoji_text_model.dart';
import 'package:fedi_app/app/status/local_status_bloc_impl.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/repository/status_repository_impl.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/status_model_adapter.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';
import 'package:unifedi_api/unifedi_api.dart';

import '../../rxdart/rxdart_test_helper.dart';
import 'status_bloc_impl_test.mocks.dart';
import 'status_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
// ignore_for_file: avoid-ignoring-return-values
@GenerateMocks([
  IUnifediApiStatusService,
  IUnifediApiAccountService,
  IUnifediApiPollService,
  IConnectionService,
])
Future<void> main() async {
  late IStatus status;
  late IStatusBloc statusBloc;
  late MockIUnifediApiStatusService unifediApiStatusServiceMock;
  late MockIUnifediApiAccountService unifediApiAccountServiceMock;
  late MockIUnifediApiPollService unifediApiPollServiceMock;
  late MockIConnectionService connectionService;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IStatusRepository statusRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory(logStatements: false));
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );

    unifediApiStatusServiceMock = MockIUnifediApiStatusService();
    unifediApiAccountServiceMock = MockIUnifediApiAccountService();
    unifediApiPollServiceMock = MockIUnifediApiPollService();
    unifediApiStatusServiceMock = MockIUnifediApiStatusService();
    connectionService = MockIConnectionService();

    when(connectionService.isConnected).thenAnswer(
      (_) => true,
    );

    status = await StatusMockHelper.createTestStatus(seed: 'seed1');

    statusBloc = LocalStatusBloc(
      connectionService: connectionService,
      status: status,
      unifediApiStatusService: unifediApiStatusServiceMock,
      statusRepository: statusRepository,
      delayInit: false,
      accountRepository: accountRepository,
      unifediApiAccountService: unifediApiAccountServiceMock,
      unifediApiPollService: unifediApiPollServiceMock,
      isNeedWatchLocalRepositoryForUpdates: true,
      isNeedRefreshFromNetworkOnInit: false,
    );
  });

  tearDown(() async {
    await statusBloc.dispose();
    await statusRepository.dispose();
    await accountRepository.dispose();
    await database.close();
  });

  Future _update(IStatus status) async {
    await statusRepository.upsertInRemoteType(
      status.toUnifediApiStatus(),
    );

    await RxDartMockHelper.waitToExecuteRxCallbacks();
  }

  test('status', () async {
    StatusMockHelper.expectStatus(statusBloc.status, status);

    var newValue = await StatusMockHelper.createTestStatus(
      seed: 'seed2',
      remoteId: status.remoteId,
    );

    IStatus? listened;

    var subscription = statusBloc.statusStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartMockHelper.waitToExecuteRxCallbacks();
    StatusMockHelper.expectStatus(
      listened,
      status,
    );

    await _update(newValue);

    StatusMockHelper.expectStatus(
      statusBloc.status,
      newValue,
    );
    StatusMockHelper.expectStatus(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('reblog', () async {
    StatusMockHelper.expectStatus(
      statusBloc.reblog,
      status.reblog,
    );

    var reblog = await StatusMockHelper.createTestStatus(seed: 'reblog');

    var newValue = await StatusMockHelper.createTestStatus(
      seed: 'seed2',
      remoteId: status.remoteId,
      reblog: reblog,
    );

    IStatus? listened;

    var subscription = statusBloc.reblogStream.listen((newValue) {
      listened = newValue;
    });
    await RxDartMockHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.reblog,
    );

    await _update(newValue);

    StatusMockHelper.expectStatus(
      statusBloc.reblog,
      reblog,
    );
    StatusMockHelper.expectStatus(
      listened,
      reblog,
    );
    await subscription.cancel();
  });
  test('reblogOrOriginal', () async {
    StatusMockHelper.expectStatus(
      statusBloc.reblogOrOriginal,
      status,
    );

    var reblog =
        await StatusMockHelper.createTestStatus(seed: 'reblogOrOriginal');

    var newValue = await StatusMockHelper.createTestStatus(
      seed: 'seed2',
      remoteId: status.remoteId,
      reblog: reblog,
    );

    IStatus? listened;

    var subscription = statusBloc.reblogOrOriginalStream.listen((newValue) {
      listened = newValue;
    });
    await RxDartMockHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status,
    );

    await _update(newValue);

    StatusMockHelper.expectStatus(
      statusBloc.reblogOrOriginal,
      reblog,
    );
    StatusMockHelper.expectStatus(
      listened,
      reblog,
    );
    await subscription.cancel();
  });

  test('content', () async {
    expect(
      statusBloc.content,
      status.content,
    );

    var newValue = 'newContent';

    String? listened;

    var subscription = statusBloc.contentStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartMockHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.content,
    );

    var dbStatusPopulatedWrapper = status.toDbStatusPopulatedWrapper();

    await _update(
      dbStatusPopulatedWrapper.copyWith(
        dbStatusPopulated: dbStatusPopulatedWrapper.dbStatusPopulated.copyWith(
          dbStatus:
              dbStatusPopulatedWrapper.dbStatusPopulated.dbStatus.copyWith(
            content: newValue,
          ),
        ),
      ),
    );

    expect(
      statusBloc.content,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('contentHtmlWithEmojis', () async {
    var newValue = 'newContent :emoji: :emoji1: :emoji2:';

    EmojiText? listened;

    var subscription = statusBloc.contentWithEmojisStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartMockHelper.waitToExecuteRxCallbacks();

    var dbStatusPopulatedWrapper = status.toDbStatusPopulatedWrapper();

    await _update(
      dbStatusPopulatedWrapper.copyWith(
        dbStatusPopulated: dbStatusPopulatedWrapper.dbStatusPopulated.copyWith(
          dbStatus:
              dbStatusPopulatedWrapper.dbStatusPopulated.dbStatus.copyWith(
            content: newValue,
          ),
        ),
      ),
    );

    expect(
      statusBloc.contentWithEmojis,
      EmojiText(
        text: newValue,
        emojis: null,
      ),
    );
    expect(
      listened,
      EmojiText(
        text: newValue,
        emojis: null,
      ),
    );

    dbStatusPopulatedWrapper = status.toDbStatusPopulatedWrapper();

    await _update(
      dbStatusPopulatedWrapper.copyWith(
        dbStatusPopulated: dbStatusPopulatedWrapper.dbStatusPopulated.copyWith(
          dbStatus:
              dbStatusPopulatedWrapper.dbStatusPopulated.dbStatus.copyWith(
            content: newValue,
            emojis: [
              UnifediApiEmoji(
                name: 'emoji1',
                url: 'https://fedi.app/emoji1.png',
                visibleInPicker: null,
                tags: null,
                staticUrl: null,
              ),
              UnifediApiEmoji(
                name: 'emoji2',
                url: 'https://fedi.app/emoji2.png',
                visibleInPicker: null,
                tags: null,
                staticUrl: null,
              ),
            ],
          ),
        ),
      ),
    );

    expect(
      statusBloc.contentWithEmojis,
      EmojiText(
        text: 'newContent :emoji: :emoji1: :emoji2:',
        emojis: [
          UnifediApiEmoji(
            name: 'emoji1',
            url: 'https://fedi.app/emoji1.png',
            staticUrl: null,
            visibleInPicker: null,
            tags: null,
          ),
          UnifediApiEmoji(
            name: 'emoji2',
            url: 'https://fedi.app/emoji2.png',
            staticUrl: null,
            visibleInPicker: null,
            tags: null,
          ),
        ],
      ),
    );
    expect(
      listened,
      EmojiText(
        text: 'newContent :emoji: :emoji1: :emoji2:',
        emojis: [
          UnifediApiEmoji(
            name: 'emoji1',
            url: 'https://fedi.app/emoji1.png',
            staticUrl: null,
            visibleInPicker: null,
            tags: null,
          ),
          UnifediApiEmoji(
            name: 'emoji2',
            url: 'https://fedi.app/emoji2.png',
            staticUrl: null,
            visibleInPicker: null,
            tags: null,
          ),
        ],
      ),
    );

    await subscription.cancel();
  });
  test('card', () async {
    expect(
      statusBloc.card,
      status.card,
    );

    var newValue = UnifediApiCard.only(
      url: 'fedi.app',
      type: UnifediApiCardType.linkValue.stringValue,
    );

    IUnifediApiCard? listened;

    var subscription = statusBloc.cardStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartMockHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.card,
    );

    var dbStatusPopulatedWrapper = status.toDbStatusPopulatedWrapper();

    await _update(
      dbStatusPopulatedWrapper.copyWith(
        dbStatusPopulated: dbStatusPopulatedWrapper.dbStatusPopulated.copyWith(
          dbStatus:
              dbStatusPopulatedWrapper.dbStatusPopulated.dbStatus.copyWith(
            card: newValue,
          ),
        ),
      ),
    );

    expect(
      statusBloc.card,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });
  //
  // test('reblogOrOriginalCard', () async {
  //   expect(
  //     statusBloc.reblogOrOriginalCard,
  //     status.card,
  //   );
  //
  //   var reblogValue = UnifediApiCard.only(
  //     url: 'fedi_1.app',
  //     type: UnifediApiCardType.linkValue.stringValue,
  //   );
  //   var newValue = UnifediApiCard.only(
  //     url: 'fedi_2.app',
  //     type: UnifediApiCardType.linkValue.stringValue,
  //   );
  //
  //   var reblog =
  //       await StatusMockHelper.createTestStatus(seed: 'reblogOrOriginalCard');
  //
  //   var listened;
  //
  //   var subscription = statusBloc.reblogOrOriginalCardStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.card,
  //   );
  //
  //   var dbStatusPopulatedWrapper = status.toDbStatusPopulatedWrapper();
  //
  //   await _update(
  //     dbStatusPopulatedWrapper.copyWith(
  //       dbStatusPopulated: dbStatusPopulatedWrapper.dbStatusPopulated.copyWith(
  //         dbStatus:
  //         reblog.dbStatusPopulated.dbStatus.copyWith(
  //           card: newValue,
  //         ),
  //       ),
  //     ),
  //   );
  //
  //   expect(
  //     statusBloc.reblogOrOriginalCard,
  //     newValue,
  //   );
  //   expect(listened, newValue);
  //
  //   dbStatusPopulatedWrapper = status.toDbStatusPopulatedWrapper();
  //
  //   await _update(
  //     dbStatusPopulatedWrapper.copyWith(
  //       dbStatusPopulated: dbStatusPopulatedWrapper.dbStatusPopulated.copyWith(
  //         dbStatus:
  //             dbStatusPopulatedWrapper.dbStatusPopulated.dbStatus.copyWith(
  //           card: newValue,
  //         ),
  //         reblogDbStatus: dbStatusPopulatedWrapper
  //             .dbStatusPopulated.reblogDbStatus!
  //             .copyWith(
  //           card: reblogValue,
  //         ),
  //       ),
  //     ),
  //   );
  //
  //   expect(statusBloc.reblogOrOriginalCard, reblogValue);
  //   expect(listened, reblogValue);
  //
  //   await subscription.cancel();
  // });
  //
  // test('isHaveReblog', () async {
  //   expect(
  //     statusBloc.isHaveReblog,
  //     status.reblog != null,
  //   );
  //
  //   var reblog = await StatusMockHelper.createTestStatus(seed: 'isHaveReblog');
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   await _update(status.copyWith(reblog: reblog));
  //
  //   expect(statusBloc.isHaveReblog, true);
  //
  //   await _update(status.copyWith(reblog: null));
  //
  //   expect(statusBloc.isHaveReblog, false);
  // });
  //
  // test('account', () async {
  //   AccountMockHelper.expectAccount(
  //     statusBloc.account,
  //     status.account,
  //   );
  //
  //   var newValue = await AccountMockHelper.createTestAccount(seed: 'seed3');
  //
  //   var listened;
  //
  //   var subscription = statusBloc.accountStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   AccountMockHelper.expectAccount(
  //     listened,
  //     status.account,
  //   );
  //
  //   await _update(status.copyWith(account: newValue));
  //
  //   AccountMockHelper.expectAccount(
  //     statusBloc.account,
  //     newValue,
  //   );
  //   AccountMockHelper.expectAccount(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('reblogOrOriginalAccount', () async {
  //   AccountMockHelper.expectAccount(
  //     statusBloc.reblogOrOriginalAccount,
  //     status.account,
  //   );
  //
  //   var reblog = await StatusMockHelper.createTestStatus(
  //     seed: 'accountReblogOrOriginal',
  //   );
  //
  //   var reblogValue = await AccountMockHelper.createTestAccount(seed: 'reblog');
  //   var newValue = await AccountMockHelper.createTestAccount(seed: 'test');
  //
  //   var listened;
  //
  //   var subscription =
  //       statusBloc.reblogOrOriginalAccountStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   AccountMockHelper.expectAccount(listened, status.account);
  //
  //   await _update(
  //     status.copyWith(
  //       reblog: reblog.copyWith(
  //         account: reblogValue,
  //       ),
  //     ),
  //   );
  //
  //   AccountMockHelper.expectAccount(
  //     statusBloc.reblogOrOriginalAccount,
  //     reblogValue,
  //   );
  //   AccountMockHelper.expectAccount(
  //     listened,
  //     reblogValue,
  //   );
  //
  //   await _update(status.copyWith(
  //     account: newValue,
  //     reblog: reblog.copyWith(account: reblogValue),
  //   ));
  //
  //   AccountMockHelper.expectAccount(
  //     statusBloc.reblogOrOriginalAccount,
  //     reblogValue,
  //   );
  //   AccountMockHelper.expectAccount(
  //     listened,
  //     reblogValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('reblogged', () async {
  //   expect(
  //     statusBloc.reblogged,
  //     status.reblogged,
  //   );
  //
  //   var newValue = !status.reblogged;
  //
  //   var listened;
  //
  //   var subscription = statusBloc.rebloggedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.reblogged,
  //   );
  //
  //   await _update(status.copyWith(reblogged: newValue));
  //
  //   expect(
  //     statusBloc.reblogged,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  // test('bookmarked', () async {
  //   expect(
  //     statusBloc.bookmarked,
  //     status.bookmarked,
  //   );
  //
  //   var newValue = !status.bookmarked;
  //
  //   var listened;
  //
  //   var subscription = statusBloc.bookmarkedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.bookmarked,
  //   );
  //
  //   await _update(status.copyWith(bookmarked: newValue));
  //
  //   expect(
  //     statusBloc.bookmarked,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  // test('pinned', () async {
  //   expect(
  //     statusBloc.pinned,
  //     status.pinned,
  //   );
  //
  //   var newValue = !status.pinned;
  //
  //   var listened;
  //
  //   var subscription = statusBloc.pinnedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(listened, status.pinned);
  //
  //   await _update(status.copyWith(pinned: newValue));
  //
  //   expect(
  //     statusBloc.pinned,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  // test('muted', () async {
  //   expect(
  //     statusBloc.muted,
  //     status.muted,
  //   );
  //
  //   var newValue = !status.muted;
  //
  //   var listened;
  //
  //   var subscription = statusBloc.mutedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(listened, status.muted);
  //
  //   await _update(status.copyWith(muted: newValue));
  //
  //   expect(
  //     statusBloc.muted,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('favourited', () async {
  //   expect(statusBloc.favourited, status.favourited);
  //
  //   var newValue = !status.favourited;
  //
  //   var listened;
  //
  //   var subscription = statusBloc.favouritedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.favourited,
  //   );
  //
  //   await _update(status.copyWith(favourited: newValue));
  //
  //   expect(
  //     statusBloc.favourited,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('isReply', () async {
  //   expect(
  //     statusBloc.isReply,
  //     status.inReplyToAccountRemoteId?.isNotEmpty == true,
  //   );
  //
  //   var newValue = 'inReplyToRemoteId';
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   await _update(status.copyWith(inReplyToRemoteId: newValue));
  //
  //   expect(statusBloc.isReply, true);
  // });
  //
  // test('isHaveReblog', () async {
  //   expect(
  //     statusBloc.isHaveReblog,
  //     status.reblog != null,
  //   );
  //
  //   var reblog = await StatusMockHelper.createTestStatus(seed: 'isHaveReblog');
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   await _update(status.copyWith(reblog: reblog));
  //
  //   expect(statusBloc.isHaveReblog, true);
  // });
  //
  // test('mediaAttachments', () async {
  //   expect(
  //     statusBloc.mediaAttachments,
  //     status.mediaAttachments,
  //   );
  //
  //   var newValue = [
  //     UnifediApiMediaAttachmentMockHelper.generate(
  //       seed: 'seed',
  //     ),
  //   ];
  //
  //   var listened;
  //
  //   var subscription = statusBloc.mediaAttachmentsStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.mediaAttachments,
  //   );
  //
  //   await _update(status.copyWith(mediaAttachments: newValue));
  //
  //   expect(
  //     statusBloc.mediaAttachments,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('emojiReactions', () async {
  //   expect(
  //     statusBloc.emojiReactions,
  //     status.emojiReactions,
  //   );
  //
  //   var newValue = [
  //     UnifediApiEmojiReaction(
  //       name: 'newName',
  //       count: 1,
  //       me: true,
  //       url: null,
  //       staticUrl: null,
  //       accounts: null,
  //     ),
  //   ];
  //
  //   var listened;
  //
  //   var subscription = statusBloc.emojiReactionsStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.emojiReactions,
  //   );
  //
  //   await _update(status.copyWith(emojiReactions: newValue));
  //
  //   expect(
  //     statusBloc.emojiReactions,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('reblogPlusOriginalEmojiReactions', () async {
  //   expect(
  //     statusBloc.reblogPlusOriginalEmojiReactions,
  //     status.emojiReactions,
  //   );
  //
  //   var reblog = await StatusMockHelper.createTestStatus(
  //     seed: 'reblogPlusOriginalEmojiReactions',
  //   );
  //
  //   var reblogEmojiAccount =
  //       await AccountMockHelper.createTestAccount(seed: 'reblogEmojiAccount');
  //   var emojiAccount =
  //       await AccountMockHelper.createTestAccount(seed: 'emojiAccount');
  //
  //   var reblogValue = [
  //     UnifediApiEmojiReaction(
  //       url: null,
  //       staticUrl: null,
  //       name: 'emoji',
  //       count: 2,
  //       me: false,
  //       accounts: [
  //         reblogEmojiAccount.toUnifediApiAccount(),
  //       ],
  //     ),
  //     UnifediApiEmojiReaction(
  //       url: null,
  //       staticUrl: null,
  //       name: 'emojiReblog',
  //       count: 1,
  //       me: true,
  //       accounts: [],
  //     ),
  //   ];
  //   var newValue = [
  //     UnifediApiEmojiReaction(
  //       url: null,
  //       staticUrl: null,
  //       name: 'emoji',
  //       count: 3,
  //       me: true,
  //       accounts: [
  //         emojiAccount.toUnifediApiAccount(),
  //       ],
  //     ),
  //     UnifediApiEmojiReaction(
  //       url: null,
  //       staticUrl: null,
  //       name: 'emojiOriginal',
  //       count: 1,
  //       me: true,
  //       accounts: [],
  //     ),
  //   ];
  //
  //   var listened;
  //
  //   var subscription =
  //       statusBloc.reblogPlusOriginalEmojiReactionsStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.emojiReactions,
  //   );
  //
  //   await _update(status.copyWith(emojiReactions: newValue));
  //
  //   expect(
  //     statusBloc.reblogPlusOriginalEmojiReactions![0],
  //     newValue[0],
  //   );
  //   expect(
  //     statusBloc.reblogPlusOriginalEmojiReactions![1],
  //     newValue[1],
  //   );
  //   expect(
  //     statusBloc.reblogPlusOriginalEmojiReactions,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //
  //   await _update(status.copyWith(
  //     emojiReactions: newValue,
  //     reblog: reblog.copyWith(emojiReactions: reblogValue),
  //   ));
  //
  //   var expected = [
  //     UnifediApiEmojiReaction(
  //       url: null,
  //       staticUrl: null,
  //       name: 'emojiOriginal',
  //       count: 1,
  //       me: true,
  //       accounts: [],
  //     ),
  //     UnifediApiEmojiReaction(
  //       url: null,
  //       staticUrl: null,
  //       name: 'emoji',
  //       count: 5,
  //       me: true,
  //       accounts: [
  //         emojiAccount.toUnifediApiAccount(),
  //         reblogEmojiAccount.toUnifediApiAccount(),
  //       ],
  //     ),
  //     UnifediApiEmojiReaction(
  //       url: null,
  //       staticUrl: null,
  //       name: 'emojiReblog',
  //       count: 1,
  //       me: true,
  //       accounts: [],
  //     ),
  //   ];
  //
  //   expect(
  //     statusBloc.reblogPlusOriginalEmojiReactions![0],
  //     expected[0],
  //   );
  //   expect(
  //     statusBloc.reblogPlusOriginalEmojiReactions![1],
  //     expected[1],
  //   );
  //   expect(
  //     statusBloc.reblogPlusOriginalEmojiReactions![2],
  //     expected[2],
  //   );
  //   expect(
  //     statusBloc.reblogPlusOriginalEmojiReactions,
  //     expected,
  //   );
  //
  //   expect(
  //     listened[0],
  //     expected[0],
  //   );
  //   expect(
  //     listened[1],
  //     expected[1],
  //   );
  //   expect(
  //     listened[2],
  //     expected[2],
  //   );
  //   expect(
  //     listened,
  //     expected,
  //   );
  //
  //   await subscription.cancel();
  // });
  //
  // test('accountAvatar', () async {
  //   expect(
  //     statusBloc.accountAvatar,
  //     status.account.avatar,
  //   );
  //
  //   var newValue = await AccountMockHelper.createTestAccount(seed: 'seed3');
  //
  //   var listened;
  //
  //   var subscription = statusBloc.accountAvatarStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.account.avatar,
  //   );
  //
  //   await _update(status.copyWith(account: newValue));
  //
  //   expect(
  //     statusBloc.accountAvatar,
  //     newValue.avatar,
  //   );
  //   expect(
  //     listened,
  //     newValue.avatar,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('mentions', () async {
  //   expect(
  //     statusBloc.mentions,
  //     status.mentions,
  //   );
  //
  //   var newValue = [
  //     UnifediApiMention(
  //       username: 'newUsername',
  //       url: 'url',
  //       id: 'id',
  //       acct: 'acct',
  //     ),
  //   ];
  //
  //   var listened;
  //
  //   var subscription = statusBloc.mentionsStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.mentions,
  //   );
  //
  //   await _update(status.copyWith(mentions: newValue));
  //
  //   expect(
  //     statusBloc.mentions,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('spoilerText', () async {
  //   expect(
  //     statusBloc.reblogOrOriginalSpoilerText,
  //     status.spoilerText,
  //   );
  //
  //   var newValue = 'newSpoilerText';
  //
  //   var listened;
  //
  //   var subscription =
  //       statusBloc.reblogOrOriginalSpoilerTextStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.spoilerText,
  //   );
  //
  //   await _update(status.copyWith(spoilerText: newValue));
  //
  //   expect(
  //     statusBloc.reblogOrOriginalSpoilerText,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('nsfwSensitive', () async {
  //   expect(
  //     statusBloc.nsfwSensitive,
  //     status.nsfwSensitive,
  //   );
  //
  //   var newValue = !statusBloc.nsfwSensitive;
  //
  //   var listened;
  //
  //   var subscription = statusBloc.nsfwSensitiveStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.nsfwSensitive,
  //   );
  //
  //   await _update(status.copyWith(nsfwSensitive: newValue));
  //
  //   expect(
  //     statusBloc.nsfwSensitive,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  // //
  // // test('nsfwSensitiveAndDisplayEnabled', () async {
  // //   var listened;
  // //
  // //   var subscription =
  // //       statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabledStream.listen((newValue) {
  // //     listened = newValue;
  // //   });
  // //
  // //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  // //
  // //   await _update(status.copyWith(nsfwSensitive: true));
  // //
  // //   expect(statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled, false);
  // //   expect(listened, false);
  // //
  // //   statusBloc.changeDisplayNsfwSensitive(true);
  // //
  // //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  // //
  // //   expect(statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled, true);
  // //   expect(listened, true);
  // //
  // //   statusBloc.changeDisplayNsfwSensitive(false);
  // //
  // //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  // //
  // //   expect(statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled, false);
  // //   expect(listened, false);
  // //
  // //   await subscription.cancel();
  // // });
  //
  // test('containsSpoiler', () async {
  //   expect(
  //     statusBloc.containsSpoiler,
  //     status.spoilerText?.isNotEmpty == true,
  //   );
  //
  //   var newValue = 'newSpoilerText';
  //
  //   var listened;
  //
  //   var subscription = statusBloc.containsSpoilerStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.spoilerText?.isNotEmpty == true,
  //   );
  //
  //   await _update(status.copyWith(spoilerText: newValue));
  //
  //   expect(statusBloc.containsSpoiler, true);
  //   expect(listened, true);
  //
  //   await _update(status.copyWith(spoilerText: ''));
  //
  //   expect(statusBloc.containsSpoiler, false);
  //   expect(listened, false);
  //   await subscription.cancel();
  // });
  // //
  // // test('containsSpoilerAndDisplayEnabled', () async {
  // //   var listened;
  // //
  // //   var subscription =
  // //       statusBloc.containsSpoilerAndDisplaySpoilerContentEnabledStream.listen((newValue) {
  // //     listened = newValue;
  // //   });
  // //
  // //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  // //
  // //   await _update(status.copyWith(spoilerText: 'newSpoilerText'));
  // //
  // //   expect(statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled, false);
  // //   expect(listened, false);
  // //
  // //   statusBloc.changeDisplaySpoiler(true);
  // //
  // //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  // //
  // //   expect(statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled, true);
  // //   expect(listened, true);
  // //
  // //   statusBloc.changeDisplaySpoiler(false);
  // //
  // //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  // //
  // //   expect(statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled, false);
  // //   expect(listened, false);
  // //
  // //   await subscription.cancel();
  // // });
  //
  // test('createdAt', () async {
  //   expect(
  //     statusBloc.createdAt,
  //     status.createdAt,
  //   );
  //
  //   var newValue = DateTime(1990);
  //
  //   var listened;
  //
  //   var subscription = statusBloc.createdAtStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.createdAt,
  //   );
  //
  //   await _update(status.copyWith(createdAt: newValue));
  //
  //   expect(
  //     statusBloc.createdAt,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('favouritesCount', () async {
  //   expect(
  //     statusBloc.favouritesCount,
  //     status.favouritesCount,
  //   );
  //
  //   var newValue = 3;
  //
  //   var listened;
  //
  //   var subscription = statusBloc.favouritesCountStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.favouritesCount,
  //   );
  //
  //   await _update(status.copyWith(favouritesCount: newValue));
  //
  //   expect(
  //     statusBloc.favouritesCount,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('reblogPlusOriginalFavouritesCount', () async {
  //   expect(
  //     statusBloc.reblogPlusOriginalFavouritesCount,
  //     status.favouritesCount,
  //   );
  //
  //   var reblogValue = 4;
  //   var newValue = 3;
  //
  //   var reblog =
  //       await StatusMockHelper.createTestStatus(seed: 'favouritesCount');
  //
  //   var listened;
  //
  //   var subscription =
  //       statusBloc.reblogPlusOriginalFavouritesCountStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.favouritesCount,
  //   );
  //
  //   await _update(status.copyWith(favouritesCount: newValue));
  //
  //   expect(
  //     statusBloc.reblogPlusOriginalFavouritesCount,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //
  //   await _update(status.copyWith(
  //     favouritesCount: newValue,
  //     reblog: reblog.copyWith(favouritesCount: reblogValue),
  //   ));
  //
  //   expect(
  //     statusBloc.reblogPlusOriginalFavouritesCount,
  //     newValue + reblogValue,
  //   );
  //   expect(
  //     listened,
  //     newValue + reblogValue,
  //   );
  //
  //   await subscription.cancel();
  // });
  //
  // test('reblogsCount', () async {
  //   expect(
  //     statusBloc.reblogsCount,
  //     status.reblogsCount,
  //   );
  //
  //   var newValue = 3;
  //
  //   var listened;
  //
  //   var subscription = statusBloc.reblogsCountStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.reblogsCount,
  //   );
  //
  //   await _update(status.copyWith(reblogsCount: newValue));
  //
  //   expect(
  //     statusBloc.reblogsCount,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('reblogPlusOriginalReblogsCount', () async {
  //   expect(
  //     statusBloc.reblogPlusOriginalReblogsCount,
  //     status.reblogsCount,
  //   );
  //
  //   var reblogValue = 4;
  //   var newValue = 3;
  //
  //   var reblog = await StatusMockHelper.createTestStatus(seed: 'reblogsCount');
  //
  //   var listened;
  //
  //   var subscription =
  //       statusBloc.reblogPlusOriginalReblogsCountStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.reblogsCount,
  //   );
  //
  //   await _update(status.copyWith(reblogsCount: newValue));
  //
  //   expect(
  //     statusBloc.reblogPlusOriginalReblogsCount,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //
  //   await _update(status.copyWith(
  //     reblogsCount: newValue,
  //     reblog: reblog.copyWith(reblogsCount: reblogValue),
  //   ));
  //
  //   expect(
  //     statusBloc.reblogPlusOriginalReblogsCount,
  //     newValue + reblogValue,
  //   );
  //   expect(
  //     listened,
  //     newValue + reblogValue,
  //   );
  //
  //   await subscription.cancel();
  // });
  //
  // test('repliesCount', () async {
  //   expect(
  //     statusBloc.repliesCount,
  //     status.repliesCount,
  //   );
  //
  //   var newValue = 3;
  //
  //   var listened;
  //
  //   var subscription = statusBloc.repliesCountStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.repliesCount,
  //   );
  //
  //   await _update(status.copyWith(repliesCount: newValue));
  //
  //   expect(
  //     statusBloc.repliesCount,
  //     newValue,
  //   );
  //   expect(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('refreshFromNetwork', () async {
  //   StatusMockHelper.expectStatus(
  //     statusBloc.status,
  //     status,
  //   );
  //
  //   var id = await statusRepository.upsertInRemoteType(
  //     status.toUnifediApiStatus(),
  //   );
  //   status = status.copyWith(id: id);
  //
  //   var newValue = await StatusMockHelper.createTestStatus(
  //     seed: 'seed2',
  //     remoteId: status.remoteId,
  //   );
  //
  //   var listened;
  //
  //   var subscription = statusBloc.statusStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   StatusMockHelper.expectStatus(
  //     listened,
  //     status,
  //   );
  //
  //   when(
  //     unifediApiStatusServiceMock.getStatus(statusId: status.remoteId!),
  //   ).thenAnswer(
  //     (_) async => newValue.toUnifediApiStatus(),
  //   );
  //
  //   await statusBloc.refreshFromNetwork();
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   StatusMockHelper.expectStatus(
  //     listened,
  //     newValue,
  //   );
  //   await subscription.cancel();
  // });
  //
  // test('loadAccountByMentionUrl', () async {
  //   var accountId1 = 'accountId1';
  //   await _update(status.copyWith(mentions: [
  //     UnifediApiMention(
  //       id: accountId1,
  //       url: 'url1',
  //       acct: 'acct1',
  //       username: 'name1',
  //     ),
  //     UnifediApiMention(
  //       id: 'accountId2',
  //       url: 'url2',
  //       acct: 'acct2',
  //       username: 'name2',
  //     ),
  //   ]));
  //
  //   var account = await AccountMockHelper.createTestAccount(
  //     seed: 'loadAccountByMentionUrl',
  //     remoteId: accountId1,
  //   );
  //
  //   when(unifediApiAccountServiceMock.getAccount(
  //     accountId: accountId1,
  //     withRelationship: false,
  //   )).thenAnswer(
  //     (_) async => account.toUnifediApiAccount(),
  //   );
  //
  //   expect(
  //     await statusBloc.loadAccountByMentionUrl(url: 'invalid url'),
  //     null,
  //   );
  //   AccountMockHelper.expectAccount(
  //     await statusBloc.loadAccountByMentionUrl(url: 'url1'),
  //     account,
  //   );
  // });
  //
  // test('inReplyToAccount', () async {
  //   var account1 =
  //       await AccountMockHelper.createTestAccount(seed: 'inReplyToAccount');
  //
  //   await accountRepository.upsertInRemoteType(
  //     account1.toUnifediApiAccount(),
  //   );
  //
  //   AccountMockHelper.expectAccount(
  //     await statusBloc.getInReplyToAccount(),
  //     null,
  //   );
  //
  //   var listened;
  //   var subscription = statusBloc.watchInReplyToAccount().listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(listened, null);
  //
  //   await _update(status.copyWith(inReplyToAccountRemoteId: account1.remoteId));
  //
  //   AccountMockHelper.expectAccount(
  //     await statusBloc.getInReplyToAccount(),
  //     account1,
  //   );
  //
  //   await subscription.cancel();
  // });
  //
  // test('requestToggleReblog', () async {
  //   var id = await statusRepository.upsertInRemoteType(
  //     status.toUnifediApiStatus(),
  //   );
  //   status = status.copyWith(id: id);
  //
  //   expect(
  //     statusBloc.reblogged,
  //     status.reblogged,
  //   );
  //
  //   bool? listened;
  //
  //   var subscription = statusBloc.rebloggedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     statusBloc.reblogged,
  //     status.reblogged,
  //   );
  //
  //   when(unifediApiStatusServiceMock.reblogStatus(
  //     statusId: status.remoteId,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(reblogged: true).toUnifediApiStatus(),
  //   );
  //
  //   when(unifediApiStatusServiceMock.unReblogStatus(
  //     statusId: status.remoteId,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(reblogged: false).toUnifediApiStatus(),
  //   );
  //
  //   var initialValue = status.reblogged;
  //
  //   await statusBloc.toggleReblog();
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.reblogged,
  //     !initialValue,
  //   );
  //   expect(
  //     listened,
  //     !initialValue,
  //   );
  //
  //   await statusBloc.toggleReblog();
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.reblogged,
  //     initialValue,
  //   );
  //   expect(
  //     listened,
  //     initialValue,
  //   );
  //
  //   await subscription.cancel();
  // });
  //
  // test('requestToggleFavourite', () async {
  //   var id = await statusRepository.upsertInRemoteType(
  //     status.toUnifediApiStatus(),
  //   );
  //   status = status.copyWith(id: id);
  //
  //   expect(
  //     statusBloc.favourited,
  //     status.favourited,
  //   );
  //
  //   bool? listened;
  //
  //   var subscription = statusBloc.favouritedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     statusBloc.favourited,
  //     status.favourited,
  //   );
  //
  //   when(unifediApiStatusServiceMock.favouriteStatus(
  //     statusId: status.remoteId,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(favourited: true).toUnifediApiStatus(),
  //   );
  //
  //   when(unifediApiStatusServiceMock.unFavouriteStatus(
  //     statusId: status.remoteId,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(favourited: false).toUnifediApiStatus(),
  //   );
  //
  //   var initialValue = status.favourited;
  //
  //   await statusBloc.toggleFavourite();
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.favourited,
  //     !initialValue,
  //   );
  //   expect(
  //     listened,
  //     !initialValue,
  //   );
  //
  //   await statusBloc.toggleFavourite();
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(statusBloc.favourited, initialValue);
  //   expect(
  //     listened,
  //     initialValue,
  //   );
  //
  //   await subscription.cancel();
  // });
  //
  // test('requestToggleMute', () async {
  //   var id = await statusRepository.upsertInRemoteType(
  //     status.toUnifediApiStatus(),
  //   );
  //   status = status.copyWith(id: id);
  //
  //   expect(
  //     statusBloc.muted,
  //     status.muted,
  //   );
  //
  //   bool? listened;
  //
  //   var subscription = statusBloc.mutedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     statusBloc.muted,
  //     status.muted,
  //   );
  //
  //   when(unifediApiStatusServiceMock.muteStatus(
  //     statusId: status.remoteId,
  //     expiresIn: null,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(muted: true).toUnifediApiStatus(),
  //   );
  //
  //   when(unifediApiStatusServiceMock.unMuteStatus(
  //     statusId: status.remoteId,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(muted: false).toUnifediApiStatus(),
  //   );
  //
  //   var initialValue = status.muted;
  //
  //   await statusBloc.toggleMute(duration: null);
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.muted,
  //     !initialValue,
  //   );
  //   expect(
  //     listened,
  //     !initialValue,
  //   );
  //
  //   await statusBloc.toggleMute(duration: null);
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.muted,
  //     initialValue,
  //   );
  //   expect(
  //     listened,
  //     initialValue,
  //   );
  //
  //   await subscription.cancel();
  // });
  //
  // test('requestToggleBookmark', () async {
  //   var id = await statusRepository.upsertInRemoteType(
  //     status.toUnifediApiStatus(),
  //   );
  //   status = status.copyWith(id: id);
  //
  //   expect(
  //     statusBloc.bookmarked,
  //     status.bookmarked,
  //   );
  //
  //   bool? listened;
  //
  //   var subscription = statusBloc.bookmarkedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     statusBloc.bookmarked,
  //     status.bookmarked,
  //   );
  //
  //   when(unifediApiStatusServiceMock.bookmarkStatus(
  //     statusId: status.remoteId,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(bookmarked: true).toUnifediApiStatus(),
  //   );
  //
  //   when(unifediApiStatusServiceMock.unBookmarkStatus(
  //     statusId: status.remoteId,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(bookmarked: false).toUnifediApiStatus(),
  //   );
  //
  //   var initialValue = status.bookmarked;
  //
  //   await statusBloc.toggleBookmark();
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.bookmarked,
  //     !initialValue,
  //   );
  //   expect(
  //     listened,
  //     !initialValue,
  //   );
  //
  //   await statusBloc.toggleBookmark();
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.bookmarked,
  //     initialValue,
  //   );
  //   expect(
  //     listened,
  //     initialValue,
  //   );
  //
  //   await subscription.cancel();
  // });
  //
  // test('requestTogglePin', () async {
  //   var id = await statusRepository.upsertInRemoteType(
  //     status.toUnifediApiStatus(),
  //   );
  //   status = status.copyWith(id: id);
  //
  //   expect(
  //     statusBloc.pinned,
  //     status.pinned,
  //   );
  //
  //   bool? listened;
  //
  //   var subscription = statusBloc.pinnedStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     statusBloc.pinned,
  //     status.pinned,
  //   );
  //
  //   when(unifediApiStatusServiceMock.pinStatus(
  //     statusId: status.remoteId,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(pinned: true).toUnifediApiStatus(),
  //   );
  //
  //   when(unifediApiStatusServiceMock.unPinStatus(
  //     statusId: status.remoteId,
  //   )).thenAnswer(
  //     (_) async => status.copyWith(pinned: false).toUnifediApiStatus(),
  //   );
  //
  //   var initialValue = status.pinned;
  //
  //   await statusBloc.togglePin();
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.pinned,
  //     !initialValue,
  //   );
  //   expect(
  //     listened,
  //     !initialValue,
  //   );
  //
  //   await statusBloc.togglePin();
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.pinned,
  //     initialValue,
  //   );
  //   expect(
  //     listened,
  //     initialValue,
  //   );
  //
  //   await subscription.cancel();
  // });
  //
  // test('requestToggleEmojiReaction', () async {
  //   var emoji1 = 'emoji1';
  //   var emoji2 = 'emoji2';
  //
  //   var account1 = await AccountMockHelper.createTestAccount(seed: 'account1');
  //   var account2 = await AccountMockHelper.createTestAccount(seed: 'account2');
  //
  //   var reaction2 = UnifediApiEmojiReaction(
  //     name: emoji2,
  //     count: 1,
  //     me: true,
  //     accounts: [
  //       account2.toUnifediApiAccount(),
  //     ],
  //     url: null,
  //     staticUrl: null,
  //   );
  //
  //   status = status.copyWith(
  //     emojiReactions: [
  //       reaction2,
  //     ],
  //   );
  //
  //   await _update(status);
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   expect(
  //     statusBloc.emojiReactions,
  //     status.emojiReactions,
  //   );
  //   expect(
  //     listEquals(
  //       statusBloc.emojiReactions,
  //       status.emojiReactions,
  //     ),
  //     true,
  //   );
  //
  //   when(unifediApiStatusServiceMock.addEmojiReaction(
  //     emoji: emoji1,
  //     statusId: status.remoteId,
  //   )).thenAnswer((_) async {
  //     var reactions = status.emojiReactions ?? <UnifediApiEmojiReaction>[];
  //
  //     var reaction = reactions.firstWhereOrNull(
  //       (reaction) => reaction.name == emoji1,
  //     );
  //
  //     if (reaction == null) {
  //       reaction = UnifediApiEmojiReaction(
  //         url: null,
  //         staticUrl: null,
  //         name: emoji1,
  //         count: 1,
  //         me: true,
  //         accounts: [
  //           account1.toUnifediApiAccount(),
  //         ],
  //       );
  //       reactions.add(reaction);
  //     } else {
  //       reactions.remove(reaction);
  //       var accounts = reaction.accounts!;
  //       accounts.add(
  //         account1.toUnifediApiAccount(),
  //       );
  //       reaction = reaction.copyWith(
  //         count: reaction.count + 1,
  //         me: true,
  //         accounts: accounts,
  //       );
  //       reactions.add(reaction);
  //     }
  //
  //     return status.copyWith(emojiReactions: reactions).toUnifediApiStatus();
  //   });
  //
  //   when(unifediApiStatusServiceMock.removeEmojiReaction(
  //     emoji: emoji1,
  //     statusId: status.remoteId,
  //   )).thenAnswer((_) async {
  //     var reactions = status.emojiReactions ?? <UnifediApiEmojiReaction>[];
  //
  //     var reaction = reactions.firstWhereOrNull(
  //       (reaction) => reaction.name == emoji1,
  //     );
  //
  //     if (reaction == null) {
  //       assert(false);
  //     } else {
  //       reactions.remove(reaction);
  //       var accounts = reaction.accounts!;
  //       accounts.remove(
  //         accounts.firstWhere((account) => account.id == account1.remoteId),
  //       );
  //       reaction = reaction.copyWith(
  //         count: reaction.count - 1,
  //         me: false,
  //         accounts: accounts,
  //       );
  //
  //       if (reaction.count > 0) {
  //         reactions.add(reaction);
  //       }
  //     }
  //
  //     var dbStatusPopulatedWrapper = status.toDbStatusPopulatedWrapper();
  //
  //     return dbStatusPopulatedWrapper
  //         .copyWith(
  //           dbStatusPopulated:
  //               dbStatusPopulatedWrapper.dbStatusPopulated.copyWith(
  //             dbStatus:
  //                 dbStatusPopulatedWrapper.dbStatusPopulated.dbStatus.copyWith(
  //               emojiReactions: reactions,
  //             ),
  //           ),
  //         )
  //         .toUnifediApiStatus();
  //   });
  //
  //   var listened;
  //
  //   var subscription = statusBloc.emojiReactionsStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //   expect(
  //     listened,
  //     status.emojiReactions,
  //   );
  //
  //   await statusBloc.toggleEmojiReaction(emoji: emoji1);
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   var newReactions = [
  //     reaction2,
  //     UnifediApiEmojiReaction(
  //       url: null,
  //       staticUrl: null,
  //       name: emoji1,
  //       count: 1,
  //       me: true,
  //       accounts: [
  //         account1.toUnifediApiAccount(),
  //       ],
  //     ),
  //   ];
  //   expect(
  //     statusBloc.emojiReactions,
  //     newReactions,
  //   );
  //   expect(
  //     listened,
  //     newReactions,
  //   );
  //
  //   await statusBloc.toggleEmojiReaction(emoji: emoji1);
  //
  //   await RxDartMockHelper.waitToExecuteRxCallbacks();
  //
  //   newReactions = [
  //     reaction2,
  //   ];
  //   expect(
  //     statusBloc.emojiReactions,
  //     newReactions,
  //   );
  //   expect(
  //     listened,
  //     newReactions,
  //   );
  //
  //   await subscription.cancel();
  // });
}
