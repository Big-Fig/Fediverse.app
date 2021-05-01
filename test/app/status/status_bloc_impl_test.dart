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
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service_impl.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_service_impl.dart';
import 'package:fedi/pleroma/api/status/auth/pleroma_api_auth_status_service_impl.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service_impl.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:moor/ffi.dart';

import '../../pleroma/api/media/pleroma_api_media_test_helper.dart';
import '../account/account_test_helper.dart';
import 'status_bloc_impl_test.mocks.dart';
import 'status_test_helper.dart';

// ignore_for_file: no-magic-number
@GenerateMocks([
  PleromaApiAuthStatusService,
  PleromaApiAuthAccountService,
  PleromaApiStatusEmojiReactionService,
  PleromaApiPollService,
])
Future<void> main() async {
  late IStatus status;
  late IStatusBloc statusBloc;
  late MockPleromaApiAuthStatusService pleromaAuthStatusServiceMock;
  late MockPleromaApiAuthAccountService pleromaAccountServiceMock;
  late MockPleromaApiStatusEmojiReactionService
      PleromaApiStatusEmojiReactionServiceMock;
  late MockPleromaApiPollService pleromaPollServiceMock;
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

    pleromaAuthStatusServiceMock = MockPleromaApiAuthStatusService();
    pleromaAccountServiceMock = MockPleromaApiAuthAccountService();
    pleromaPollServiceMock = MockPleromaApiPollService();
    PleromaApiStatusEmojiReactionServiceMock =
        MockPleromaApiStatusEmojiReactionService();

    when(pleromaAuthStatusServiceMock.isConnected).thenReturn(true);
    when(pleromaAuthStatusServiceMock.pleromaApiState)
        .thenReturn(PleromaApiState.validAuth);

    when(pleromaAccountServiceMock.isConnected).thenReturn(true);
    when(pleromaAccountServiceMock.pleromaApiState)
        .thenReturn(PleromaApiState.validAuth);

    when(PleromaApiStatusEmojiReactionServiceMock.isConnected).thenReturn(true);
    when(PleromaApiStatusEmojiReactionServiceMock.pleromaApiState)
        .thenReturn(PleromaApiState.validAuth);

    status = await StatusTestHelper.createTestStatus(seed: "seed1");

    statusBloc = LocalStatusBloc(
      status: status,
      pleromaAuthStatusService: pleromaAuthStatusServiceMock,
      statusRepository: statusRepository,
      delayInit: false,
      accountRepository: accountRepository,
      pleromaAccountService: pleromaAccountServiceMock,
      PleromaApiStatusEmojiReactionService:
          PleromaApiStatusEmojiReactionServiceMock,
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
      status.toPleromaStatus(),
    );
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('status', () async {
    StatusTestHelper.expectStatus(statusBloc.status, status);

    var newValue = await StatusTestHelper.createTestStatus(
      seed: "seed2",
      remoteId: status.remoteId,
    );

    var listenedValue;

    var subscription = statusBloc.statusStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    StatusTestHelper.expectStatus(
      listenedValue,
      status,
    );

    await _update(newValue);

    StatusTestHelper.expectStatus(
      statusBloc.status,
      newValue,
    );
    StatusTestHelper.expectStatus(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('reblog', () async {
    StatusTestHelper.expectStatus(
      statusBloc.reblog,
      status.reblog,
    );

    var reblog = await StatusTestHelper.createTestStatus(seed: "reblog");

    var newValue = await StatusTestHelper.createTestStatus(
      seed: "seed2",
      remoteId: status.remoteId,
      reblog: reblog,
    );

    var listenedValue;

    var subscription = statusBloc.reblogStream.listen((newValue) {
      listenedValue = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.reblog,
    );

    await _update(newValue);

    StatusTestHelper.expectStatus(
      statusBloc.reblog,
      reblog,
    );
    StatusTestHelper.expectStatus(
      listenedValue,
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
        await StatusTestHelper.createTestStatus(seed: "reblogOrOriginal");

    var newValue = await StatusTestHelper.createTestStatus(
      seed: "seed2",
      remoteId: status.remoteId,
      reblog: reblog,
    );

    var listenedValue;

    var subscription = statusBloc.reblogOrOriginalStream.listen((newValue) {
      listenedValue = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status,
    );

    await _update(newValue);

    StatusTestHelper.expectStatus(
      statusBloc.reblogOrOriginal,
      reblog,
    );
    StatusTestHelper.expectStatus(
      listenedValue,
      reblog,
    );
    await subscription.cancel();
  });

  test('content', () async {
    expect(
      statusBloc.content,
      status.content,
    );

    var newValue = "newContent";

    var listenedValue;

    var subscription = statusBloc.contentStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.content,
    );

    await _update(status.copyWith(content: newValue));

    expect(
      statusBloc.content,
      newValue,
    );
    expect(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('contentHtmlWithEmojis', () async {
    var newValue = "newContent :emoji: :emoji1: :emoji2:";

    var listenedValue;

    var subscription = statusBloc.contentWithEmojisStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

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
      listenedValue,
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
          shortcode: "emoji1",
          url: "https://fedi.app/emoji1.png",
          visibleInPicker: null,
          category: null,
          staticUrl: null,
        ),
        PleromaApiEmoji(
          shortcode: "emoji2",
          url: "https://fedi.app/emoji2.png",
          visibleInPicker: null,
          category: null,
          staticUrl: null,
        ),
      ],
    ));
    expect(
      statusBloc.contentWithEmojis,
      EmojiText(
        text: "newContent :emoji: :emoji1: :emoji2:",
        emojis: [
          PleromaApiEmoji(
            shortcode: "emoji1",
            url: "https://fedi.app/emoji1.png",
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
          PleromaApiEmoji(
            shortcode: "emoji2",
            url: "https://fedi.app/emoji2.png",
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
        ],
      ),
    );
    expect(
      listenedValue,
      EmojiText(
        text: "newContent :emoji: :emoji1: :emoji2:",
        emojis: [
          PleromaApiEmoji(
            shortcode: "emoji1",
            url: "https://fedi.app/emoji1.png",
            staticUrl: null,
            visibleInPicker: null,
            category: null,
          ),
          PleromaApiEmoji(
            shortcode: "emoji2",
            url: "https://fedi.app/emoji2.png",
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

    var newValue = PleromaApiCard.only(url: "fedi.app");

    var listenedValue;

    var subscription = statusBloc.cardStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.card,
    );

    await _update(status.copyWith(card: newValue));

    expect(
      statusBloc.card,
      newValue,
    );
    expect(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('reblogOrOriginalCard', () async {
    expect(
      statusBloc.reblogOrOriginalCard,
      status.card,
    );

    var reblogValue = PleromaApiCard.only(url: "fedi_1.app");
    var newValue = PleromaApiCard.only(url: "fedi_2.app");

    var reblog =
        await StatusTestHelper.createTestStatus(seed: "reblogOrOriginalCard");

    var listenedValue;

    var subscription = statusBloc.reblogOrOriginalCardStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.card,
    );

    await _update(status.copyWith(card: newValue));

    expect(
      statusBloc.reblogOrOriginalCard,
      newValue,
    );
    expect(listenedValue, newValue);

    await _update(status.copyWith(
      card: newValue,
      reblog: reblog.copyWith(
        card: reblogValue,
      ),
    ));

    expect(statusBloc.reblogOrOriginalCard, reblogValue);
    expect(listenedValue, reblogValue);

    await subscription.cancel();
  });

  test('isHaveReblog', () async {
    expect(
      statusBloc.isHaveReblog,
      status.reblog != null,
    );

    var reblog = await StatusTestHelper.createTestStatus(seed: "isHaveReblog");

    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

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

    var newValue = await AccountTestHelper.createTestAccount(seed: "seed3");

    var listenedValue;

    var subscription = statusBloc.accountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    AccountTestHelper.expectAccount(
      listenedValue,
      status.account,
    );

    await _update(status.copyWith(account: newValue));

    AccountTestHelper.expectAccount(
      statusBloc.account,
      newValue,
    );
    AccountTestHelper.expectAccount(
      listenedValue,
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
        seed: "accountReblogOrOriginal");

    var reblogValue = await AccountTestHelper.createTestAccount(seed: "reblog");
    var newValue = await AccountTestHelper.createTestAccount(seed: "test");

    var listenedValue;

    var subscription =
        statusBloc.reblogOrOriginalAccountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    AccountTestHelper.expectAccount(listenedValue, status.account);

    await _update(
      status.copyWith(reblog: reblog.copyWith(account: reblogValue)),
    );

    AccountTestHelper.expectAccount(
      statusBloc.reblogOrOriginalAccount,
      reblogValue,
    );
    AccountTestHelper.expectAccount(
      listenedValue,
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
      listenedValue,
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

    var listenedValue;

    var subscription = statusBloc.rebloggedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.reblogged,
    );

    await _update(status.copyWith(reblogged: newValue));

    expect(
      statusBloc.reblogged,
      newValue,
    );
    expect(
      listenedValue,
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

    var listenedValue;

    var subscription = statusBloc.bookmarkedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.bookmarked,
    );

    await _update(status.copyWith(bookmarked: newValue));

    expect(
      statusBloc.bookmarked,
      newValue,
    );
    expect(
      listenedValue,
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

    var listenedValue;

    var subscription = statusBloc.pinnedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.pinned);

    await _update(status.copyWith(pinned: newValue));

    expect(
      statusBloc.pinned,
      newValue,
    );
    expect(
      listenedValue,
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

    var listenedValue;

    var subscription = statusBloc.mutedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.muted);

    await _update(status.copyWith(muted: newValue));

    expect(
      statusBloc.muted,
      newValue,
    );
    expect(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('favourited', () async {
    expect(statusBloc.favourited, status.favourited);

    var newValue = !status.favourited;

    var listenedValue;

    var subscription = statusBloc.favouritedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.favourited,
    );

    await _update(status.copyWith(favourited: newValue));

    expect(
      statusBloc.favourited,
      newValue,
    );
    expect(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('isReply', () async {
    expect(
      statusBloc.isReply,
      status.inReplyToAccountRemoteId?.isNotEmpty == true,
    );

    var newValue = "inReplyToRemoteId";

    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    await _update(status.copyWith(inReplyToRemoteId: newValue));

    expect(statusBloc.isReply, true);
  });

  test('isHaveReblog', () async {
    expect(
      statusBloc.isHaveReblog,
      status.reblog != null,
    );

    var reblog = await StatusTestHelper.createTestStatus(seed: "isHaveReblog");

    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

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
        seed: "seed",
      )
    ];

    var listenedValue;

    var subscription = statusBloc.mediaAttachmentsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.mediaAttachments,
    );

    await _update(status.copyWith(mediaAttachments: newValue));

    expect(
      statusBloc.mediaAttachments,
      newValue,
    );
    expect(
      listenedValue,
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
        name: "newName",
        count: 1,
        me: true,
      ),
    ];

    var listenedValue;

    var subscription =
        statusBloc.pleromaEmojiReactionsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.pleromaEmojiReactions,
    );

    await _update(status.copyWith(pleromaEmojiReactions: newValue));

    expect(
      statusBloc.pleromaEmojiReactions,
      newValue,
    );
    expect(
      listenedValue,
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
        seed: "reblogPlusOriginalEmojiReactions");

    var reblogEmojiAccount =
        await AccountTestHelper.createTestAccount(seed: "reblogEmojiAccount");
    var emojiAccount =
        await AccountTestHelper.createTestAccount(seed: "emojiAccount");

    var reblogValue = [
      PleromaApiStatusEmojiReaction(
        name: "emoji",
        count: 2,
        me: false,
        accounts: [
          reblogEmojiAccount.toPleromaApiAccount(),
        ],
      ),
      PleromaApiStatusEmojiReaction(
        name: "emojiReblog",
        count: 1,
        me: true,
        accounts: [],
      ),
    ];
    var newValue = [
      PleromaApiStatusEmojiReaction(
        name: "emoji",
        count: 3,
        me: true,
        accounts: [
          emojiAccount.toPleromaApiAccount(),
        ],
      ),
      PleromaApiStatusEmojiReaction(
        name: "emojiOriginal",
        count: 1,
        me: true,
        accounts: [],
      ),
    ];

    var listenedValue;

    var subscription =
        statusBloc.reblogPlusOriginalEmojiReactionsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
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
      listenedValue,
      newValue,
    );

    await _update(status.copyWith(
      pleromaEmojiReactions: newValue,
      reblog: reblog.copyWith(pleromaEmojiReactions: reblogValue),
    ));

    var expected = [
      PleromaApiStatusEmojiReaction(
        name: "emojiOriginal",
        count: 1,
        me: true,
        accounts: [],
      ),
      PleromaApiStatusEmojiReaction(
        name: "emoji",
        count: 5,
        me: true,
        accounts: [
          emojiAccount.toPleromaApiAccount(),
          reblogEmojiAccount.toPleromaApiAccount(),
        ],
      ),
      PleromaApiStatusEmojiReaction(
        name: "emojiReblog",
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
      listenedValue[0],
      expected[0],
    );
    expect(
      listenedValue[1],
      expected[1],
    );
    expect(
      listenedValue[2],
      expected[2],
    );
    expect(
      listenedValue,
      expected,
    );

    await subscription.cancel();
  });

  test('accountAvatar', () async {
    expect(
      statusBloc.accountAvatar,
      status.account.avatar,
    );

    var newValue = await AccountTestHelper.createTestAccount(seed: "seed3");

    var listenedValue;

    var subscription = statusBloc.accountAvatarStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.account.avatar,
    );

    await _update(status.copyWith(account: newValue));

    expect(
      statusBloc.accountAvatar,
      newValue.avatar,
    );
    expect(
      listenedValue,
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
        username: "newUsername",
        url: 'url',
        id: 'id',
        acct: 'acct',
      ),
    ];

    var listenedValue;

    var subscription = statusBloc.mentionsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.mentions,
    );

    await _update(status.copyWith(mentions: newValue));

    expect(
      statusBloc.mentions,
      newValue,
    );
    expect(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('spoilerText', () async {
    expect(
      statusBloc.reblogOrOriginalSpoilerText,
      status.spoilerText,
    );

    var newValue = "newSpoilerText";

    var listenedValue;

    var subscription =
        statusBloc.reblogOrOriginalSpoilerTextStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.spoilerText,
    );

    await _update(status.copyWith(spoilerText: newValue));

    expect(
      statusBloc.reblogOrOriginalSpoilerText,
      newValue,
    );
    expect(
      listenedValue,
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

    var listenedValue;

    var subscription = statusBloc.nsfwSensitiveStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.nsfwSensitive,
    );

    await _update(status.copyWith(nsfwSensitive: newValue));

    expect(
      statusBloc.nsfwSensitive,
      newValue,
    );
    expect(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });
  //
  // test('nsfwSensitiveAndDisplayEnabled', () async {
  //   var listenedValue;
  //
  //   var subscription =
  //       statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabledStream.listen((newValue) {
  //     listenedValue = newValue;
  //   });
  //   // hack to execute notify callbacks
  //   await Future.delayed(Duration(milliseconds: 1));
  //
  //   await _update(status.copyWith(nsfwSensitive: true));
  //
  //   expect(statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled, false);
  //   expect(listenedValue, false);
  //
  //   statusBloc.changeDisplayNsfwSensitive(true);
  //   // hack to execute notify callbacks
  //   await Future.delayed(Duration(milliseconds: 1));
  //
  //   expect(statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled, true);
  //   expect(listenedValue, true);
  //
  //   statusBloc.changeDisplayNsfwSensitive(false);
  //   // hack to execute notify callbacks
  //   await Future.delayed(Duration(milliseconds: 1));
  //
  //   expect(statusBloc.nsfwSensitiveAndDisplayNsfwContentEnabled, false);
  //   expect(listenedValue, false);
  //
  //   await subscription.cancel();
  // });

  test('containsSpoiler', () async {
    expect(
      statusBloc.containsSpoiler,
      status.spoilerText?.isNotEmpty == true,
    );

    var newValue = "newSpoilerText";

    var listenedValue;

    var subscription = statusBloc.containsSpoilerStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.spoilerText?.isNotEmpty == true,
    );

    await _update(status.copyWith(spoilerText: newValue));

    expect(statusBloc.containsSpoiler, true);
    expect(listenedValue, true);

    await _update(status.copyWith(spoilerText: ""));

    expect(statusBloc.containsSpoiler, false);
    expect(listenedValue, false);
    await subscription.cancel();
  });
  //
  // test('containsSpoilerAndDisplayEnabled', () async {
  //   var listenedValue;
  //
  //   var subscription =
  //       statusBloc.containsSpoilerAndDisplaySpoilerContentEnabledStream.listen((newValue) {
  //     listenedValue = newValue;
  //   });
  //   // hack to execute notify callbacks
  //   await Future.delayed(Duration(milliseconds: 1));
  //
  //   await _update(status.copyWith(spoilerText: "newSpoilerText"));
  //
  //   expect(statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled, false);
  //   expect(listenedValue, false);
  //
  //   statusBloc.changeDisplaySpoiler(true);
  //   // hack to execute notify callbacks
  //   await Future.delayed(Duration(milliseconds: 1));
  //
  //   expect(statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled, true);
  //   expect(listenedValue, true);
  //
  //   statusBloc.changeDisplaySpoiler(false);
  //   // hack to execute notify callbacks
  //   await Future.delayed(Duration(milliseconds: 1));
  //
  //   expect(statusBloc.containsSpoilerAndDisplaySpoilerContentEnabled, false);
  //   expect(listenedValue, false);
  //
  //   await subscription.cancel();
  // });

  test('createdAt', () async {
    expect(
      statusBloc.createdAt,
      status.createdAt,
    );

    var newValue = DateTime(1990);

    var listenedValue;

    var subscription = statusBloc.createdAtStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.createdAt,
    );

    await _update(status.copyWith(createdAt: newValue));

    expect(
      statusBloc.createdAt,
      newValue,
    );
    expect(
      listenedValue,
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

    var listenedValue;

    var subscription = statusBloc.favouritesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.favouritesCount,
    );

    await _update(status.copyWith(favouritesCount: newValue));

    expect(
      statusBloc.favouritesCount,
      newValue,
    );
    expect(
      listenedValue,
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
        await StatusTestHelper.createTestStatus(seed: "favouritesCount");

    var listenedValue;

    var subscription =
        statusBloc.reblogPlusOriginalFavouritesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.favouritesCount,
    );

    await _update(status.copyWith(favouritesCount: newValue));

    expect(
      statusBloc.reblogPlusOriginalFavouritesCount,
      newValue,
    );
    expect(
      listenedValue,
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
      listenedValue,
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

    var listenedValue;

    var subscription = statusBloc.reblogsCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.reblogsCount,
    );

    await _update(status.copyWith(reblogsCount: newValue));

    expect(
      statusBloc.reblogsCount,
      newValue,
    );
    expect(
      listenedValue,
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

    var reblog = await StatusTestHelper.createTestStatus(seed: "reblogsCount");

    var listenedValue;

    var subscription =
        statusBloc.reblogPlusOriginalReblogsCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.reblogsCount,
    );

    await _update(status.copyWith(reblogsCount: newValue));

    expect(
      statusBloc.reblogPlusOriginalReblogsCount,
      newValue,
    );
    expect(
      listenedValue,
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
      listenedValue,
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

    var listenedValue;

    var subscription = statusBloc.repliesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.repliesCount,
    );

    await _update(status.copyWith(repliesCount: newValue));

    expect(
      statusBloc.repliesCount,
      newValue,
    );
    expect(
      listenedValue,
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
      status.toPleromaStatus(),
    );
    status = status.copyWith(id: id);

    var newValue = await StatusTestHelper.createTestStatus(
      seed: "seed2",
      remoteId: status.remoteId,
    );

    var listenedValue;

    var subscription = statusBloc.statusStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    StatusTestHelper.expectStatus(
      listenedValue,
      status,
    );

    when(
      pleromaAuthStatusServiceMock.getStatus(statusRemoteId: status.remoteId),
    ).thenAnswer(
      (_) async => newValue.toPleromaStatus(),
    );

    await statusBloc.refreshFromNetwork();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    StatusTestHelper.expectStatus(
      listenedValue,
      newValue,
    );
    await subscription.cancel();
  });

  test('loadAccountByMentionUrl', () async {
    var accountId1 = "accountId1";
    await _update(status.copyWith(mentions: [
      PleromaApiMention(
        id: accountId1,
        url: "url1",
        acct: "acct1",
        username: "name1",
      ),
      PleromaApiMention(
        id: "accountId2",
        url: "url2",
        acct: "acct2",
        username: "name2",
      ),
    ]));

    var account = await AccountTestHelper.createTestAccount(
      seed: "loadAccountByMentionUrl",
      remoteId: accountId1,
    );

    when(pleromaAccountServiceMock.getAccount(accountRemoteId: accountId1))
        .thenAnswer(
      (_) async => account.toPleromaApiAccount(),
    );

    expect(
      await statusBloc.loadAccountByMentionUrl(url: "invalid url"),
      null,
    );
    AccountTestHelper.expectAccount(
      await statusBloc.loadAccountByMentionUrl(url: "url1"),
      account,
    );
  });

  test('inReplyToAccount', () async {
    var account1 =
        await AccountTestHelper.createTestAccount(seed: "inReplyToAccount");

    await accountRepository.upsertInRemoteType(
      account1.toPleromaApiAccount(),
    );

    AccountTestHelper.expectAccount(
      await statusBloc.getInReplyToAccount(),
      null,
    );

    var listenedValue;
    var subscription = statusBloc.watchInReplyToAccount().listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, null);

    await _update(status.copyWith(inReplyToAccountRemoteId: account1.remoteId));

    AccountTestHelper.expectAccount(
      await statusBloc.getInReplyToAccount(),
      account1,
    );

    await subscription.cancel();
  });

  test('requestToggleReblog', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.reblogged,
      status.reblogged,
    );

    bool? listenedValue;

    var subscription = statusBloc.rebloggedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      statusBloc.reblogged,
      status.reblogged,
    );

    when(pleromaAuthStatusServiceMock.reblogStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(reblogged: true).toPleromaStatus(),
    );

    when(pleromaAuthStatusServiceMock.unReblogStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(reblogged: false).toPleromaStatus(),
    );

    var initialValue = status.reblogged;

    await statusBloc.toggleReblog();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      statusBloc.reblogged,
      !initialValue,
    );
    expect(
      listenedValue,
      !initialValue,
    );

    await statusBloc.toggleReblog();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      statusBloc.reblogged,
      initialValue,
    );
    expect(
      listenedValue,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestToggleFavourite', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.favourited,
      status.favourited,
    );

    bool? listenedValue;

    var subscription = statusBloc.favouritedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      statusBloc.favourited,
      status.favourited,
    );

    when(pleromaAuthStatusServiceMock.favouriteStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(favourited: true).toPleromaStatus(),
    );

    when(pleromaAuthStatusServiceMock.unFavouriteStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(favourited: false).toPleromaStatus(),
    );

    var initialValue = status.favourited;

    await statusBloc.toggleFavourite();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      statusBloc.favourited,
      !initialValue,
    );
    expect(
      listenedValue,
      !initialValue,
    );

    await statusBloc.toggleFavourite();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(statusBloc.favourited, initialValue);
    expect(
      listenedValue,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestToggleMute', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.muted,
      status.muted,
    );

    bool? listenedValue;

    var subscription = statusBloc.mutedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      statusBloc.muted,
      status.muted,
    );

    when(pleromaAuthStatusServiceMock.muteStatus(
      statusRemoteId: status.remoteId,
      expireDurationInSeconds: null,
    )).thenAnswer(
      (_) async => status.copyWith(muted: true).toPleromaStatus(),
    );

    when(pleromaAuthStatusServiceMock.unMuteStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(muted: false).toPleromaStatus(),
    );

    var initialValue = status.muted;

    await statusBloc.toggleMute(duration: null);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      statusBloc.muted,
      !initialValue,
    );
    expect(
      listenedValue,
      !initialValue,
    );

    await statusBloc.toggleMute(duration: null);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      statusBloc.muted,
      initialValue,
    );
    expect(
      listenedValue,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestToggleBookmark', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.bookmarked,
      status.bookmarked,
    );

    bool? listenedValue;

    var subscription = statusBloc.bookmarkedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      statusBloc.bookmarked,
      status.bookmarked,
    );

    when(pleromaAuthStatusServiceMock.bookmarkStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(bookmarked: true).toPleromaStatus(),
    );

    when(pleromaAuthStatusServiceMock.unBookmarkStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(bookmarked: false).toPleromaStatus(),
    );

    var initialValue = status.bookmarked;

    await statusBloc.toggleBookmark();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      statusBloc.bookmarked,
      !initialValue,
    );
    expect(
      listenedValue,
      !initialValue,
    );

    await statusBloc.toggleBookmark();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      statusBloc.bookmarked,
      initialValue,
    );
    expect(
      listenedValue,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestTogglePin', () async {
    var id = await statusRepository.upsertInRemoteType(
      status.toPleromaStatus(),
    );
    status = status.copyWith(id: id);

    expect(
      statusBloc.pinned,
      status.pinned,
    );

    bool? listenedValue;

    var subscription = statusBloc.pinnedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      statusBloc.pinned,
      status.pinned,
    );

    when(pleromaAuthStatusServiceMock.pinStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(pinned: true).toPleromaStatus(),
    );

    when(pleromaAuthStatusServiceMock.unPinStatus(
      statusRemoteId: status.remoteId,
    )).thenAnswer(
      (_) async => status.copyWith(pinned: false).toPleromaStatus(),
    );

    var initialValue = status.pinned;

    await statusBloc.togglePin();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      statusBloc.pinned,
      !initialValue,
    );
    expect(
      listenedValue,
      !initialValue,
    );

    await statusBloc.togglePin();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(
      statusBloc.pinned,
      initialValue,
    );
    expect(
      listenedValue,
      initialValue,
    );

    await subscription.cancel();
  });

  test('requestToggleEmojiReaction', () async {
    var emoji1 = "emoji1";
    var emoji2 = "emoji2";

    var account1 = await AccountTestHelper.createTestAccount(seed: "account1");
    var account2 = await AccountTestHelper.createTestAccount(seed: "account2");

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
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

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

    when(PleromaApiStatusEmojiReactionServiceMock.addReaction(
      emoji: emoji1,
      statusRemoteId: status.remoteId,
    )).thenAnswer((_) async {
      List<PleromaApiStatusEmojiReaction> reactions =
          status.pleromaEmojiReactions ?? [];

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
          .toPleromaStatus();
    });

    when(PleromaApiStatusEmojiReactionServiceMock.removeReaction(
      emoji: emoji1,
      statusRemoteId: status.remoteId,
    )).thenAnswer((_) async {
      List<PleromaApiStatusEmojiReaction> reactions =
          status.pleromaEmojiReactions ?? [];

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
          .toPleromaStatus();
    });

    var listenedValue;

    var subscription =
        statusBloc.pleromaEmojiReactionsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(
      listenedValue,
      status.pleromaEmojiReactions,
    );

    await statusBloc.toggleEmojiReaction(emoji: emoji1);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

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
      listenedValue,
      newReactions,
    );

    await statusBloc.toggleEmojiReaction(emoji: emoji1);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    newReactions = [
      reaction2,
    ];
    expect(
      statusBloc.pleromaEmojiReactions,
      newReactions,
    );
    expect(
      listenedValue,
      newReactions,
    );

    await subscription.cancel();
  });
}
