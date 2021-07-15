import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/status/local_status_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/repository/status_repository_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_service.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../../pleroma/api/media/pleroma_api_media_test_helper.dart';
import '../../rxdart/rxdart_test_helper.dart';
import '../account/account_test_helper.dart';
import 'status_bloc_impl_test.mocks.dart';
import 'status_test_helper.dart';

// ignore_for_file: no-magic-number, avoid-late-keyword
@GenerateMocks([
  IPleromaApiAuthStatusService,
  IPleromaApiAuthAccountService,
  IPleromaApiStatusEmojiReactionService,
  IPleromaApiPollService,
])
Future<void> main() async {
  late IStatus status;
  late IStatusBloc statusBloc;
  late MockIPleromaApiAuthStatusService pleromaAuthStatusServiceMock;
  late MockIPleromaApiAuthAccountService pleromaAccountServiceMock;
  late MockIPleromaApiStatusEmojiReactionService
      pleromaApiStatusEmojiReactionServiceMock;
  late MockIPleromaApiPollService pleromaPollServiceMock;
  late AppDatabase database;
  late IAccountRepository accountRepository;
  late IStatusRepository statusRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
      appDatabase: database,
      accountRepository: accountRepository,
    );

    pleromaAuthStatusServiceMock = MockIPleromaApiAuthStatusService();
    pleromaAccountServiceMock = MockIPleromaApiAuthAccountService();
    pleromaPollServiceMock = MockIPleromaApiPollService();
    pleromaApiStatusEmojiReactionServiceMock =
        MockIPleromaApiStatusEmojiReactionService();

    when(pleromaAuthStatusServiceMock.isConnected).thenReturn(true);
    when(pleromaAuthStatusServiceMock.pleromaApiState)
        .thenReturn(PleromaApiState.validAuth);

    when(pleromaAccountServiceMock.isConnected).thenReturn(true);
    when(pleromaAccountServiceMock.pleromaApiState)
        .thenReturn(PleromaApiState.validAuth);

    when(pleromaApiStatusEmojiReactionServiceMock.isConnected).thenReturn(true);
    when(pleromaApiStatusEmojiReactionServiceMock.pleromaApiState)
        .thenReturn(PleromaApiState.validAuth);

    status = await StatusTestHelper.createTestStatus(seed: 'seed1');

    statusBloc = LocalStatusBloc(
      status: status,
      pleromaAuthStatusService: pleromaAuthStatusServiceMock,
      statusRepository: statusRepository,
      delayInit: false,
      accountRepository: accountRepository,
      pleromaAccountService: pleromaAccountServiceMock,
      pleromaApiStatusEmojiReactionService:
          pleromaApiStatusEmojiReactionServiceMock,
      pleromaPollService: pleromaPollServiceMock,
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
      status.toPleromaApiStatus(),
    );

    await RxDartTestHelper.waitToExecuteRxCallbacks();
  }

  test('status', () async {
    StatusTestHelper.expectStatus(statusBloc.status, status);

    var newValue = await StatusTestHelper.createTestStatus(
      seed: 'seed2',
      remoteId: status.remoteId,
    );

    var listened;

    var subscription = statusBloc.statusStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    StatusTestHelper.expectStatus(
      listened,
      status,
    );

    await _update(newValue);

    StatusTestHelper.expectStatus(
      statusBloc.status,
      newValue,
    );
    StatusTestHelper.expectStatus(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('reblog', () async {
    StatusTestHelper.expectStatus(
      statusBloc.reblog,
      status.reblog,
    );

    var reblog = await StatusTestHelper.createTestStatus(seed: 'reblog');

    var newValue = await StatusTestHelper.createTestStatus(
      seed: 'seed2',
      remoteId: status.remoteId,
      reblog: reblog,
    );

    var listened;

    var subscription = statusBloc.reblogStream.listen((newValue) {
      listened = newValue;
    });
    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.reblog,
    );

    await _update(newValue);

    StatusTestHelper.expectStatus(
      statusBloc.reblog,
      reblog,
    );
    StatusTestHelper.expectStatus(
      listened,
      reblog,
    );
    await subscription.cancel();
  });
  test('reblogOrOriginal', () async {
    StatusTestHelper.expectStatus(
      statusBloc.reblogOrOriginal,
      status,
    );

    var reblog =
        await StatusTestHelper.createTestStatus(seed: 'reblogOrOriginal');

    var newValue = await StatusTestHelper.createTestStatus(
      seed: 'seed2',
      remoteId: status.remoteId,
      reblog: reblog,
    );

    var listened;

    var subscription = statusBloc.reblogOrOriginalStream.listen((newValue) {
      listened = newValue;
    });
    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status,
    );

    await _update(newValue);

    StatusTestHelper.expectStatus(
      statusBloc.reblogOrOriginal,
      reblog,
    );
    StatusTestHelper.expectStatus(
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

    var listened;

    var subscription = statusBloc.contentStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.content,
    );

    await _update(status.copyWith(content: newValue));

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

    var listened;

    var subscription = statusBloc.contentWithEmojisStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    // same if emojis is empty or null
    await _update(status.copyWith(
      content: newValue,
      emojis: [],
    ));

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

    // same if emojis is empty or null
    await _update(status.copyWith(
      content: newValue,
      emojis: [
        PleromaApiEmoji(
          shortcode: 'emoji1',
          url: 'https://fedi.app/emoji1.png',
          visibleInPicker: null,
          category: null,
          staticUrl: null,
        ),
        PleromaApiEmoji(
          shortcode: 'emoji2',
          url: 'https://fedi.app/emoji2.png',
          visibleInPicker: null,
          category: null,
          staticUrl: null,
        ),
      ],
    ));
    expect(
      statusBloc.contentWithEmojis,
      EmojiText(
        text: 'newContent :emoji: :emoji1: :emoji2:',
        emojis: [
          PleromaApiEmoji(
            shortcode: 'emoji1',
            url: 'https://fedi.app/emoji1.png',
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
          PleromaApiEmoji(
            shortcode: 'emoji2',
            url: 'https://fedi.app/emoji2.png',
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
        ],
      ),
    );
    expect(
      listened,
      EmojiText(
        text: 'newContent :emoji: :emoji1: :emoji2:',
        emojis: [
          PleromaApiEmoji(
            shortcode: 'emoji1',
            url: 'https://fedi.app/emoji1.png',
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
          PleromaApiEmoji(
            shortcode: 'emoji2',
            url: 'https://fedi.app/emoji2.png',
            staticUrl: null,
            visibleInPicker: null,
            category: null,
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

    var newValue = PleromaApiCard.only(url: 'fedi.app');

    var listened;

    var subscription = statusBloc.cardStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.card,
    );

    await _update(status.copyWith(card: newValue));

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

  test('reblogOrOriginalCard', () async {
    expect(
      statusBloc.reblogOrOriginalCard,
      status.card,
    );

    var reblogValue = PleromaApiCard.only(url: 'fedi_1.app');
    var newValue = PleromaApiCard.only(url: 'fedi_2.app');

    var reblog =
        await StatusTestHelper.createTestStatus(seed: 'reblogOrOriginalCard');

    var listened;

    var subscription = statusBloc.reblogOrOriginalCardStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.card,
    );

    await _update(status.copyWith(card: newValue));

    expect(
      statusBloc.reblogOrOriginalCard,
      newValue,
    );
    expect(listened, newValue);

    await _update(status.copyWith(
      card: newValue,
      reblog: reblog.copyWith(
        card: reblogValue,
      ),
    ));

    expect(statusBloc.reblogOrOriginalCard, reblogValue);
    expect(listened, reblogValue);

    await subscription.cancel();
  });

  test('isHaveReblog', () async {
    expect(
      statusBloc.isHaveReblog,
      status.reblog != null,
    );

    var reblog = await StatusTestHelper.createTestStatus(seed: 'isHaveReblog');

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    await _update(status.copyWith(reblog: reblog));

    expect(statusBloc.isHaveReblog, true);

    await _update(status.copyWith(reblog: null));

    expect(statusBloc.isHaveReblog, false);
  });

  test('account', () async {
    AccountTestHelper.expectAccount(
      statusBloc.account,
      status.account,
    );

    var newValue = await AccountTestHelper.createTestAccount(seed: 'seed3');

    var listened;

    var subscription = statusBloc.accountStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    AccountTestHelper.expectAccount(
      listened,
      status.account,
    );

    await _update(status.copyWith(account: newValue));

    AccountTestHelper.expectAccount(
      statusBloc.account,
      newValue,
    );
    AccountTestHelper.expectAccount(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('reblogOrOriginalAccount', () async {
    AccountTestHelper.expectAccount(
      statusBloc.reblogOrOriginalAccount,
      status.account,
    );

    var reblog = await StatusTestHelper.createTestStatus(
      seed: 'accountReblogOrOriginal',
    );

    var reblogValue = await AccountTestHelper.createTestAccount(seed: 'reblog');
    var newValue = await AccountTestHelper.createTestAccount(seed: 'test');

    var listened;

    var subscription =
        statusBloc.reblogOrOriginalAccountStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    AccountTestHelper.expectAccount(listened, status.account);

    await _update(
      status.copyWith(reblog: reblog.copyWith(account: reblogValue)),
    );

    AccountTestHelper.expectAccount(
      statusBloc.reblogOrOriginalAccount,
      reblogValue,
    );
    AccountTestHelper.expectAccount(
      listened,
      reblogValue,
    );

    await _update(status.copyWith(
      account: newValue,
      reblog: reblog.copyWith(account: reblogValue),
    ));

    AccountTestHelper.expectAccount(
      statusBloc.reblogOrOriginalAccount,
      reblogValue,
    );
    AccountTestHelper.expectAccount(
      listened,
      reblogValue,
    );
    await subscription.cancel();
  });

  test('reblogged', () async {
    expect(
      statusBloc.reblogged,
      status.reblogged,
    );

    var newValue = !status.reblogged;

    var listened;

    var subscription = statusBloc.rebloggedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.reblogged,
    );

    await _update(status.copyWith(reblogged: newValue));

    expect(
      statusBloc.reblogged,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });
  test('bookmarked', () async {
    expect(
      statusBloc.bookmarked,
      status.bookmarked,
    );

    var newValue = !status.bookmarked;

    var listened;

    var subscription = statusBloc.bookmarkedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.bookmarked,
    );

    await _update(status.copyWith(bookmarked: newValue));

    expect(
      statusBloc.bookmarked,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });
  test('pinned', () async {
    expect(
      statusBloc.pinned,
      status.pinned,
    );

    var newValue = !status.pinned;

    var listened;

    var subscription = statusBloc.pinnedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(listened, status.pinned);

    await _update(status.copyWith(pinned: newValue));

    expect(
      statusBloc.pinned,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });
  test('muted', () async {
    expect(
      statusBloc.muted,
      status.muted,
    );

    var newValue = !status.muted;

    var listened;

    var subscription = statusBloc.mutedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(listened, status.muted);

    await _update(status.copyWith(muted: newValue));

    expect(
      statusBloc.muted,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('favourited', () async {
    expect(statusBloc.favourited, status.favourited);

    var newValue = !status.favourited;

    var listened;

    var subscription = statusBloc.favouritedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.favourited,
    );

    await _update(status.copyWith(favourited: newValue));

    expect(
      statusBloc.favourited,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('isReply', () async {
    expect(
      statusBloc.isReply,
      status.inReplyToAccountRemoteId?.isNotEmpty == true,
    );

    var newValue = 'inReplyToRemoteId';

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    await _update(status.copyWith(inReplyToRemoteId: newValue));

    expect(statusBloc.isReply, true);
  });

  test('isHaveReblog', () async {
    expect(
      statusBloc.isHaveReblog,
      status.reblog != null,
    );

    var reblog = await StatusTestHelper.createTestStatus(seed: 'isHaveReblog');

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    await _update(status.copyWith(reblog: reblog));

    expect(statusBloc.isHaveReblog, true);
  });

  test('mediaAttachments', () async {
    expect(
      statusBloc.mediaAttachments,
      status.mediaAttachments,
    );

    var newValue = [
      PleromaApiMediaTestHelper.createTestPleromaApiMediaAttachment(
        seed: 'seed',
      ),
    ];

    var listened;

    var subscription = statusBloc.mediaAttachmentsStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.mediaAttachments,
    );

    await _update(status.copyWith(mediaAttachments: newValue));

    expect(
      statusBloc.mediaAttachments,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('emojiReactions', () async {
    expect(
      statusBloc.pleromaEmojiReactions,
      status.pleromaEmojiReactions,
    );

    var newValue = [
      PleromaApiStatusEmojiReaction.only(
        name: 'newName',
        count: 1,
        me: true,
      ),
    ];

    var listened;

    var subscription =
        statusBloc.pleromaEmojiReactionsStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.pleromaEmojiReactions,
    );

    await _update(status.copyWith(pleromaEmojiReactions: newValue));

    expect(
      statusBloc.pleromaEmojiReactions,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('reblogPlusOriginalEmojiReactions', () async {
    expect(
      statusBloc.reblogPlusOriginalPleromaEmojiReactions,
      status.pleromaEmojiReactions,
    );

    var reblog = await StatusTestHelper.createTestStatus(
      seed: 'reblogPlusOriginalEmojiReactions',
    );

    var reblogEmojiAccount =
        await AccountTestHelper.createTestAccount(seed: 'reblogEmojiAccount');
    var emojiAccount =
        await AccountTestHelper.createTestAccount(seed: 'emojiAccount');

    var reblogValue = [
      PleromaApiStatusEmojiReaction(
        name: 'emoji',
        count: 2,
        me: false,
        accounts: [
          reblogEmojiAccount.toPleromaApiAccount(),
        ],
      ),
      PleromaApiStatusEmojiReaction(
        name: 'emojiReblog',
        count: 1,
        me: true,
        accounts: [],
      ),
    ];
    var newValue = [
      PleromaApiStatusEmojiReaction(
        name: 'emoji',
        count: 3,
        me: true,
        accounts: [
          emojiAccount.toPleromaApiAccount(),
        ],
      ),
      PleromaApiStatusEmojiReaction(
        name: 'emojiOriginal',
        count: 1,
        me: true,
        accounts: [],
      ),
    ];

    var listened;

    var subscription =
        statusBloc.reblogPlusOriginalEmojiReactionsStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.pleromaEmojiReactions,
    );

    await _update(status.copyWith(pleromaEmojiReactions: newValue));

    expect(
      statusBloc.reblogPlusOriginalPleromaEmojiReactions![0],
      newValue[0],
    );
    expect(
      statusBloc.reblogPlusOriginalPleromaEmojiReactions![1],
      newValue[1],
    );
    expect(
      statusBloc.reblogPlusOriginalPleromaEmojiReactions,
      newValue,
    );
    expect(
      listened,
      newValue,
    );

    await _update(status.copyWith(
      pleromaEmojiReactions: newValue,
      reblog: reblog.copyWith(pleromaEmojiReactions: reblogValue),
    ));

    var expected = [
      PleromaApiStatusEmojiReaction(
        name: 'emojiOriginal',
        count: 1,
        me: true,
        accounts: [],
      ),
      PleromaApiStatusEmojiReaction(
        name: 'emoji',
        count: 5,
        me: true,
        accounts: [
          emojiAccount.toPleromaApiAccount(),
          reblogEmojiAccount.toPleromaApiAccount(),
        ],
      ),
      PleromaApiStatusEmojiReaction(
        name: 'emojiReblog',
        count: 1,
        me: true,
        accounts: [],
      ),
    ];

    expect(
      statusBloc.reblogPlusOriginalPleromaEmojiReactions![0],
      expected[0],
    );
    expect(
      statusBloc.reblogPlusOriginalPleromaEmojiReactions![1],
      expected[1],
    );
    expect(
      statusBloc.reblogPlusOriginalPleromaEmojiReactions![2],
      expected[2],
    );
    expect(
      statusBloc.reblogPlusOriginalPleromaEmojiReactions,
      expected,
    );

    expect(
      listened[0],
      expected[0],
    );
    expect(
      listened[1],
      expected[1],
    );
    expect(
      listened[2],
      expected[2],
    );
    expect(
      listened,
      expected,
    );

    await subscription.cancel();
  });

  test('accountAvatar', () async {
    expect(
      statusBloc.accountAvatar,
      status.account.avatar,
    );

    var newValue = await AccountTestHelper.createTestAccount(seed: 'seed3');

    var listened;

    var subscription = statusBloc.accountAvatarStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.account.avatar,
    );

    await _update(status.copyWith(account: newValue));

    expect(
      statusBloc.accountAvatar,
      newValue.avatar,
    );
    expect(
      listened,
      newValue.avatar,
    );
    await subscription.cancel();
  });

  test('mentions', () async {
    expect(
      statusBloc.mentions,
      status.mentions,
    );

    var newValue = [
      PleromaApiMention.only(
        username: 'newUsername',
        url: 'url',
        id: 'id',
        acct: 'acct',
      ),
    ];

    var listened;

    var subscription = statusBloc.mentionsStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.mentions,
    );

    await _update(status.copyWith(mentions: newValue));

    expect(
      statusBloc.mentions,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('spoilerText', () async {
    expect(
      statusBloc.reblogOrOriginalSpoilerText,
      status.spoilerText,
    );

    var newValue = 'newSpoilerText';

    var listened;

    var subscription =
        statusBloc.reblogOrOriginalSpoilerTextStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.spoilerText,
    );

    await _update(status.copyWith(spoilerText: newValue));

    expect(
      statusBloc.reblogOrOriginalSpoilerText,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('nsfwSensitive', () async {
    expect(
      statusBloc.nsfwSensitive,
      status.nsfwSensitive,
    );

    var newValue = !statusBloc.nsfwSensitive;

    var listened;

    var subscription = statusBloc.nsfwSensitiveStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.nsfwSensitive,
    );

    await _update(status.copyWith(nsfwSensitive: newValue));

    expect(
      statusBloc.nsfwSensitive,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });
  //
  // test('nsfwSensitiveAndDisplayEnabled', () async {
  //   var listened;
  //
  //   var subscription =
  //       statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabledStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartTestHelper.waitToExecuteRxCallbacks();
  //
  //   await _update(status.copyWith(nsfwSensitive: true));
  //
  //   expect(statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled, false);
  //   expect(listened, false);
  //
  //   statusBloc.changeDisplayNsfwSensitive(true);
  //
  //   await RxDartTestHelper.waitToExecuteRxCallbacks();
  //
  //   expect(statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled, true);
  //   expect(listened, true);
  //
  //   statusBloc.changeDisplayNsfwSensitive(false);
  //
  //   await RxDartTestHelper.waitToExecuteRxCallbacks();
  //
  //   expect(statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled, false);
  //   expect(listened, false);
  //
  //   await subscription.cancel();
  // });

  test('containsSpoiler', () async {
    expect(
      statusBloc.containsSpoiler,
      status.spoilerText?.isNotEmpty == true,
    );

    var newValue = 'newSpoilerText';

    var listened;

    var subscription = statusBloc.containsSpoilerStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.spoilerText?.isNotEmpty == true,
    );

    await _update(status.copyWith(spoilerText: newValue));

    expect(statusBloc.containsSpoiler, true);
    expect(listened, true);

    await _update(status.copyWith(spoilerText: ''));

    expect(statusBloc.containsSpoiler, false);
    expect(listened, false);
    await subscription.cancel();
  });
  //
  // test('containsSpoilerAndDisplayEnabled', () async {
  //   var listened;
  //
  //   var subscription =
  //       statusBloc.containsSpoilerAndDisplaySpoilerContentEnabledStream.listen((newValue) {
  //     listened = newValue;
  //   });
  //
  //   await RxDartTestHelper.waitToExecuteRxCallbacks();
  //
  //   await _update(status.copyWith(spoilerText: 'newSpoilerText'));
  //
  //   expect(statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled, false);
  //   expect(listened, false);
  //
  //   statusBloc.changeDisplaySpoiler(true);
  //
  //   await RxDartTestHelper.waitToExecuteRxCallbacks();
  //
  //   expect(statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled, true);
  //   expect(listened, true);
  //
  //   statusBloc.changeDisplaySpoiler(false);
  //
  //   await RxDartTestHelper.waitToExecuteRxCallbacks();
  //
  //   expect(statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled, false);
  //   expect(listened, false);
  //
  //   await subscription.cancel();
  // });

  test('createdAt', () async {
    expect(
      statusBloc.createdAt,
      status.createdAt,
    );

    var newValue = DateTime(1990);

    var listened;

    var subscription = statusBloc.createdAtStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.createdAt,
    );

    await _update(status.copyWith(createdAt: newValue));

    expect(
      statusBloc.createdAt,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('favouritesCount', () async {
    expect(
      statusBloc.favouritesCount,
      status.favouritesCount,
    );

    var newValue = 3;

    var listened;

    var subscription = statusBloc.favouritesCountStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.favouritesCount,
    );

    await _update(status.copyWith(favouritesCount: newValue));

    expect(
      statusBloc.favouritesCount,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('reblogPlusOriginalFavouritesCount', () async {
    expect(
      statusBloc.reblogPlusOriginalFavouritesCount,
      status.favouritesCount,
    );

    var reblogValue = 4;
    var newValue = 3;

    var reblog =
        await StatusTestHelper.createTestStatus(seed: 'favouritesCount');

    var listened;

    var subscription =
        statusBloc.reblogPlusOriginalFavouritesCountStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.favouritesCount,
    );

    await _update(status.copyWith(favouritesCount: newValue));

    expect(
      statusBloc.reblogPlusOriginalFavouritesCount,
      newValue,
    );
    expect(
      listened,
      newValue,
    );

    await _update(status.copyWith(
      favouritesCount: newValue,
      reblog: reblog.copyWith(favouritesCount: reblogValue),
    ));

    expect(
      statusBloc.reblogPlusOriginalFavouritesCount,
      newValue + reblogValue,
    );
    expect(
      listened,
      newValue + reblogValue,
    );

    await subscription.cancel();
  });

  test('reblogsCount', () async {
    expect(
      statusBloc.reblogsCount,
      status.reblogsCount,
    );

    var newValue = 3;

    var listened;

    var subscription = statusBloc.reblogsCountStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.reblogsCount,
    );

    await _update(status.copyWith(reblogsCount: newValue));

    expect(
      statusBloc.reblogsCount,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('reblogPlusOriginalReblogsCount', () async {
    expect(
      statusBloc.reblogPlusOriginalReblogsCount,
      status.reblogsCount,
    );

    var reblogValue = 4;
    var newValue = 3;

    var reblog = await StatusTestHelper.createTestStatus(seed: 'reblogsCount');

    var listened;

    var subscription =
        statusBloc.reblogPlusOriginalReblogsCountStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.reblogsCount,
    );

    await _update(status.copyWith(reblogsCount: newValue));

    expect(
      statusBloc.reblogPlusOriginalReblogsCount,
      newValue,
    );
    expect(
      listened,
      newValue,
    );

    await _update(status.copyWith(
      reblogsCount: newValue,
      reblog: reblog.copyWith(reblogsCount: reblogValue),
    ));

    expect(
      statusBloc.reblogPlusOriginalReblogsCount,
      newValue + reblogValue,
    );
    expect(
      listened,
      newValue + reblogValue,
    );

    await subscription.cancel();
  });

  test('repliesCount', () async {
    expect(
      statusBloc.repliesCount,
      status.repliesCount,
    );

    var newValue = 3;

    var listened;

    var subscription = statusBloc.repliesCountStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.repliesCount,
    );

    await _update(status.copyWith(repliesCount: newValue));

    expect(
      statusBloc.repliesCount,
      newValue,
    );
    expect(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('refreshFromNetwork', () async {
    StatusTestHelper.expectStatus(
      statusBloc.status,
      status,
    );

    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaApiStatus(),
    );
    status = status.copyWith(id: id);

    var newValue = await StatusTestHelper.createTestStatus(
      seed: 'seed2',
      remoteId: status.remoteId,
    );

    var listened;

    var subscription = statusBloc.statusStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    StatusTestHelper.expectStatus(
      listened,
      status,
    );

    when(
      pleromaAuthStatusServiceMock.getStatus(statusRemoteId: status.remoteId!),
    ).thenAnswer(
      (_) async => newValue.toPleromaApiStatus(),
    );

    await statusBloc.refreshFromNetwork();

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    StatusTestHelper.expectStatus(
      listened,
      newValue,
    );
    await subscription.cancel();
  });

  test('loadAccountByMentionUrl', () async {
    var accountId1 = 'accountId1';
    await _update(status.copyWith(mentions: [
      PleromaApiMention(
        id: accountId1,
        url: 'url1',
        acct: 'acct1',
        username: 'name1',
      ),
      PleromaApiMention(
        id: 'accountId2',
        url: 'url2',
        acct: 'acct2',
        username: 'name2',
      ),
    ]));

    var account = await AccountTestHelper.createTestAccount(
      seed: 'loadAccountByMentionUrl',
      remoteId: accountId1,
    );

    when(pleromaAccountServiceMock.getAccount(
      accountRemoteId: accountId1,
      withRelationship: false,
    )).thenAnswer(
      (_) async => account.toPleromaApiAccount(),
    );

    expect(
      await statusBloc.loadAccountByMentionUrl(url: 'invalid url'),
      null,
    );
    AccountTestHelper.expectAccount(
      await statusBloc.loadAccountByMentionUrl(url: 'url1'),
      account,
    );
  });

  test('inReplyToAccount', () async {
    var account1 =
        await AccountTestHelper.createTestAccount(seed: 'inReplyToAccount');

    await accountRepository.upsertInRemoteType(
      account1.toPleromaApiAccount(),
    );

    AccountTestHelper.expectAccount(
      await statusBloc.getInReplyToAccount(),
      null,
    );

    var listened;
    var subscription = statusBloc.watchInReplyToAccount().listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(listened, null);

    await _update(status.copyWith(inReplyToAccountRemoteId: account1.remoteId));

    AccountTestHelper.expectAccount(
      await statusBloc.getInReplyToAccount(),
      account1,
    );

    await subscription.cancel();
  });

  test('requestToggleReblog', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaApiStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.reblogged,
      status.reblogged,
    );

    bool? listened;

    var subscription = statusBloc.rebloggedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      statusBloc.reblogged,
      status.reblogged,
    );

    when(pleromaAuthStatusServiceMock.reblogStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(reblogged: true).toPleromaApiStatus(),
    );

    when(pleromaAuthStatusServiceMock.unReblogStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(reblogged: false).toPleromaApiStatus(),
    );

    var initialValue = status.reblogged;

    await statusBloc.toggleReblog();

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.reblogged,
      !initialValue,
    );
    expect(
      listened,
      !initialValue,
    );

    await statusBloc.toggleReblog();

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.reblogged,
      initialValue,
    );
    expect(
      listened,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestToggleFavourite', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaApiStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.favourited,
      status.favourited,
    );

    bool? listened;

    var subscription = statusBloc.favouritedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      statusBloc.favourited,
      status.favourited,
    );

    when(pleromaAuthStatusServiceMock.favouriteStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(favourited: true).toPleromaApiStatus(),
    );

    when(pleromaAuthStatusServiceMock.unFavouriteStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(favourited: false).toPleromaApiStatus(),
    );

    var initialValue = status.favourited;

    await statusBloc.toggleFavourite();

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.favourited,
      !initialValue,
    );
    expect(
      listened,
      !initialValue,
    );

    await statusBloc.toggleFavourite();

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(statusBloc.favourited, initialValue);
    expect(
      listened,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestToggleMute', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaApiStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.muted,
      status.muted,
    );

    bool? listened;

    var subscription = statusBloc.mutedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      statusBloc.muted,
      status.muted,
    );

    when(pleromaAuthStatusServiceMock.muteStatus(
      statusRemoteId: status.remoteId,
      expireDurationInSeconds: null,
    )).thenAnswer(
      (_) async => status.copyWith(muted: true).toPleromaApiStatus(),
    );

    when(pleromaAuthStatusServiceMock.unMuteStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(muted: false).toPleromaApiStatus(),
    );

    var initialValue = status.muted;

    await statusBloc.toggleMute(duration: null);

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.muted,
      !initialValue,
    );
    expect(
      listened,
      !initialValue,
    );

    await statusBloc.toggleMute(duration: null);

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.muted,
      initialValue,
    );
    expect(
      listened,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestToggleBookmark', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaApiStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.bookmarked,
      status.bookmarked,
    );

    bool? listened;

    var subscription = statusBloc.bookmarkedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      statusBloc.bookmarked,
      status.bookmarked,
    );

    when(pleromaAuthStatusServiceMock.bookmarkStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(bookmarked: true).toPleromaApiStatus(),
    );

    when(pleromaAuthStatusServiceMock.unBookmarkStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(bookmarked: false).toPleromaApiStatus(),
    );

    var initialValue = status.bookmarked;

    await statusBloc.toggleBookmark();

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.bookmarked,
      !initialValue,
    );
    expect(
      listened,
      !initialValue,
    );

    await statusBloc.toggleBookmark();

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.bookmarked,
      initialValue,
    );
    expect(
      listened,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestTogglePin', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaApiStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.pinned,
      status.pinned,
    );

    bool? listened;

    var subscription = statusBloc.pinnedStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      statusBloc.pinned,
      status.pinned,
    );

    when(pleromaAuthStatusServiceMock.pinStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(pinned: true).toPleromaApiStatus(),
    );

    when(pleromaAuthStatusServiceMock.unPinStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(pinned: false).toPleromaApiStatus(),
    );

    var initialValue = status.pinned;

    await statusBloc.togglePin();

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.pinned,
      !initialValue,
    );
    expect(
      listened,
      !initialValue,
    );

    await statusBloc.togglePin();

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.pinned,
      initialValue,
    );
    expect(
      listened,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestToggleEmojiReaction', () async {
    var emoji1 = 'emoji1';
    var emoji2 = 'emoji2';

    var account1 = await AccountTestHelper.createTestAccount(seed: 'account1');
    var account2 = await AccountTestHelper.createTestAccount(seed: 'account2');

    var reaction2 = PleromaApiStatusEmojiReaction(
      name: emoji2,
      count: 1,
      me: true,
      accounts: [
        account2.toPleromaApiAccount(),
      ],
    );

    status = status.copyWith(
      pleromaEmojiReactions: [
        reaction2,
      ],
    );

    await _update(status);

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    expect(
      statusBloc.pleromaEmojiReactions,
      status.pleromaEmojiReactions,
    );
    expect(
      listEquals(
        statusBloc.pleromaEmojiReactions,
        status.pleromaEmojiReactions,
      ),
      true,
    );

    when(pleromaApiStatusEmojiReactionServiceMock.addReaction(
      emoji: emoji1,
      statusRemoteId: status.remoteId,
    )).thenAnswer((_) async {
      var reactions =
          status.pleromaEmojiReactions ?? <PleromaApiStatusEmojiReaction>[];

      var reaction = reactions.firstWhereOrNull(
        (reaction) => reaction.name == emoji1,
      );

      if (reaction == null) {
        reaction = PleromaApiStatusEmojiReaction(
          name: emoji1,
          count: 1,
          me: true,
          accounts: [
            account1.toPleromaApiAccount(),
          ],
        );
        reactions.add(reaction);
      } else {
        reactions.remove(reaction);
        var accounts = reaction.accounts!;
        accounts.add(
          account1.toPleromaApiAccount(),
        );
        reaction = reaction.copyWith(
          count: reaction.count + 1,
          me: true,
          accounts: accounts,
        );
        reactions.add(reaction);
      }

      return status
          .copyWith(pleromaEmojiReactions: reactions)
          .toPleromaApiStatus();
    });

    when(pleromaApiStatusEmojiReactionServiceMock.removeReaction(
      emoji: emoji1,
      statusRemoteId: status.remoteId,
    )).thenAnswer((_) async {
      var reactions =
          status.pleromaEmojiReactions ?? <PleromaApiStatusEmojiReaction>[];

      var reaction = reactions.firstWhereOrNull(
        (reaction) => reaction.name == emoji1,
      );

      if (reaction == null) {
        assert(false);
      } else {
        reactions.remove(reaction);
        var accounts = reaction.accounts!;
        accounts.remove(
          accounts.firstWhere((account) => account.id == account1.remoteId),
        );
        reaction = reaction.copyWith(
          count: reaction.count - 1,
          me: false,
          accounts: accounts,
        );

        if (reaction.count > 0) {
          reactions.add(reaction);
        }
      }

      return status
          .copyWith(pleromaEmojiReactions: reactions)
          .toPleromaApiStatus();
    });

    var listened;

    var subscription =
        statusBloc.pleromaEmojiReactionsStream.listen((newValue) {
      listened = newValue;
    });

    await RxDartTestHelper.waitToExecuteRxCallbacks();
    expect(
      listened,
      status.pleromaEmojiReactions,
    );

    await statusBloc.toggleEmojiReaction(emoji: emoji1);

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    var newReactions = [
      reaction2,
      PleromaApiStatusEmojiReaction(
        name: emoji1,
        count: 1,
        me: true,
        accounts: [
          account1.toPleromaApiAccount(),
        ],
      ),
    ];
    expect(
      statusBloc.pleromaEmojiReactions,
      newReactions,
    );
    expect(
      listened,
      newReactions,
    );

    await statusBloc.toggleEmojiReaction(emoji: emoji1);

    await RxDartTestHelper.waitToExecuteRxCallbacks();

    newReactions = [
      reaction2,
    ];
    expect(
      statusBloc.pleromaEmojiReactions,
      newReactions,
    );
    expect(
      listened,
      newReactions,
    );

    await subscription.cancel();
  });
}
