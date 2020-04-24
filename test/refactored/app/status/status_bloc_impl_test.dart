import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/account/repository/account_repository_impl.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository_impl.dart';
import 'package:fedi/refactored/app/status/status_bloc.dart';
import 'package:fedi/refactored/app/status/status_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/status_model_adapter.dart';
import 'package:fedi/refactored/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/refactored/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/refactored/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/refactored/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:moor_ffi/moor_ffi.dart';

import '../../pleroma/account/pleroma_account_service_mock.dart';
import '../../pleroma/status/pleroma_status_emoji_reaction_service.dart';
import '../../pleroma/status/pleroma_status_service_mock.dart';
import '../account/account_model_helper.dart';
import 'status_model_helper.dart';

void main() {
  IStatus status;
  IStatusBloc statusBloc;
  PleromaStatusServiceMock pleromaStatusServiceMock;
  PleromaAccountServiceMock pleromaAccountServiceMock;
  PleromaStatusEmojiReactionServiceMock pleromaStatusEmojiReactionServiceMock;
  AppDatabase database;
  IAccountRepository accountRepository;
  IStatusRepository statusRepository;

  setUp(() async {
    database = AppDatabase(VmDatabase.memory());
    accountRepository = AccountRepository(appDatabase: database);
    statusRepository = StatusRepository(
        appDatabase: database, accountRepository: accountRepository);

    pleromaStatusServiceMock = PleromaStatusServiceMock();
    pleromaAccountServiceMock = PleromaAccountServiceMock();
    pleromaStatusEmojiReactionServiceMock =
        PleromaStatusEmojiReactionServiceMock();

    when(pleromaStatusServiceMock.isApiReadyToUse).thenReturn(true);
    when(pleromaAccountServiceMock.isApiReadyToUse).thenReturn(true);
    when(pleromaStatusEmojiReactionServiceMock.isApiReadyToUse)
        .thenReturn(true);

    status = await createTestStatus(seed: "seed1");

    statusBloc = StatusBloc(
        status: status,
        pleromaStatusService: pleromaStatusServiceMock,
        statusRepository: statusRepository,
        delayInit: false,
        accountRepository: accountRepository,
        pleromaAccountService: pleromaAccountServiceMock,
        pleromaStatusEmojiReactionService:
            pleromaStatusEmojiReactionServiceMock);
  });

  tearDown(() async {
    statusBloc.dispose();
    statusRepository.dispose();
    accountRepository.dispose();
    await database.close();
  });

  Future _update(IStatus status) async {
    await statusRepository.upsertRemoteStatus(
        mapLocalStatusToRemoteStatus(status),
        conversationRemoteId: null,
        listRemoteId: null);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
  }

  test('status', () async {
    expectStatus(statusBloc.status, status);

    var newValue =
        await createTestStatus(seed: "seed2", remoteId: status.remoteId);

    var listenedValue;

    var subscription = statusBloc.statusStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectStatus(listenedValue, status);

    await _update(newValue);

    expectStatus(statusBloc.status, newValue);
    expectStatus(listenedValue, newValue);
    subscription.cancel();
  });

  test('reblog', () async {
    expectStatus(statusBloc.reblog, status.reblog);

    var reblog = await createTestStatus(seed: "reblog");

    var newValue = await createTestStatus(
        seed: "seed2", remoteId: status.remoteId, reblog: reblog);

    var listenedValue;

    var subscription = statusBloc.reblogStream.listen((newValue) {
      listenedValue = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.reblog);

    await _update(newValue);

    expectStatus(statusBloc.reblog, reblog);
    expectStatus(listenedValue, reblog);
    subscription.cancel();
  });
  test('reblogOrOriginal', () async {
    expectStatus(statusBloc.reblogOrOriginal, status);

    var reblog = await createTestStatus(seed: "reblogOrOriginal");

    var newValue = await createTestStatus(
        seed: "seed2", remoteId: status.remoteId, reblog: reblog);

    var listenedValue;

    var subscription = statusBloc.reblogOrOriginalStream.listen((newValue) {
      listenedValue = newValue;
    });
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status);

    await _update(newValue);

    expectStatus(statusBloc.reblogOrOriginal, reblog);
    expectStatus(listenedValue, reblog);
    subscription.cancel();
  });

  test('content', () async {
    expect(statusBloc.content, status.content);

    var newValue = "newContent";

    var listenedValue;

    var subscription = statusBloc.contentStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.content);

    await _update(status.copyWith(content: newValue));

    expect(statusBloc.content, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('contentHtmlWithEmojis', () async {
    var newValue = "newContent :emoji :emoji1 :emoji2";

    var listenedValue;

    var subscription = statusBloc.contentWithEmojisStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    // same if emojis is empty or null
    await _update(status.copyWith(content: newValue, emojis: []));

    expect(statusBloc.contentWithEmojis, newValue);
    expect(listenedValue, newValue);

    // same if emojis is empty or null
    await _update(status.copyWith(content: newValue, emojis: [
      PleromaEmoji(shortcode: "emoji1", url: "https://fedi.app/emoji1.png"),
      PleromaEmoji(shortcode: "emoji2", url: "https://fedi.app/emoji2.png")
    ]));

    expect(
        statusBloc.contentWithEmojis,
        "<html><body>newContent :emoji "
        "<img src=\"https://fedi.app/emoji1.png\" width=\"20\"> "
        "<img src=\"https://fedi.app/emoji2.png\" width=\"20\">"
        "</body></html>");
    expect(
        listenedValue,
        "<html><body>newContent :emoji "
        "<img src=\"https://fedi.app/emoji1.png\" width=\"20\"> "
        "<img src=\"https://fedi.app/emoji2.png\" width=\"20\">"
        "</body></html>");

    subscription.cancel();
  });
  test('contentWithEmojisWithoutAccount', () async {
    var newValue = "newContent :emoji :emoji1 :emoji2 @<span>acct<\/span>";

    var listenedValue;

    var subscription =
        statusBloc.contentWithEmojisWithoutAccountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    // same if emojis is empty or null
    await _update(status.copyWith(content: newValue, emojis: []));

    expect(statusBloc.contentWithEmojisWithoutAccount,
        "newContent :emoji :emoji1 :emoji2 </a>");
    expect(listenedValue, "newContent :emoji :emoji1 :emoji2 </a>");

    // same if emojis is empty or null
    await _update(status.copyWith(content: newValue, emojis: [
      PleromaEmoji(shortcode: "emoji1", url: "https://fedi.app/emoji1.png"),
      PleromaEmoji(shortcode: "emoji2", url: "https://fedi.app/emoji2.png")
    ]));

    expect(
        statusBloc.contentWithEmojisWithoutAccount,
        "<html><body>newContent :emoji "
        "<img src=\"https://fedi.app/emoji1.png\" width=\"20\"> "
        "<img src=\"https://fedi.app/emoji2.png\" width=\"20\"> "
        "</a>"
        "</body></html>");
    expect(
        listenedValue,
        "<html><body>newContent :emoji "
        "<img src=\"https://fedi.app/emoji1.png\" width=\"20\"> "
        "<img src=\"https://fedi.app/emoji2.png\" width=\"20\"> "
        "</a>"
        "</body></html>");

    subscription.cancel();
  });

  test('card', () async {
    expect(statusBloc.card, status.card);

    var newValue = PleromaCard(url: "fedi.app");

    var listenedValue;

    var subscription = statusBloc.cardStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.card);

    await _update(status.copyWith(card: newValue));

    expect(statusBloc.card, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('reblogOrOriginalCard', () async {
    expect(statusBloc.reblogOrOriginalCard, status.card);

    var reblogValue = PleromaCard(url: "fedi1.app");
    var newValue = PleromaCard(url: "fedi2.app");

    var reblog = await createTestStatus(seed: "reblogOrOriginalCard");

    var listenedValue;

    var subscription = statusBloc.reblogOrOriginalCardStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.card);

    await _update(status.copyWith(card: newValue));

    expect(statusBloc.reblogOrOriginalCard, newValue);
    expect(listenedValue, newValue);

    await _update(status.copyWith(
        card: newValue, reblog: reblog.copyWith(card: reblogValue)));

    expect(statusBloc.reblogOrOriginalCard, reblogValue);
    expect(listenedValue, reblogValue);

    subscription.cancel();
  });

  test('isHaveReblog', () async {
    expect(statusBloc.isHaveReblog, status.reblog != null);

    var reblog = await createTestStatus(seed: "isHaveReblog");

    var listenedValue;

    var subscription = statusBloc.isHaveReblogStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.reblog != null);

    await _update(status.copyWith(reblog: reblog));

    expect(statusBloc.isHaveReblog, true);
    expect(listenedValue, true);

    await _update(status.copyWith(reblog: null));

    expect(statusBloc.isHaveReblog, false);
    expect(listenedValue, false);

    subscription.cancel();
  });

  test('account', () async {
    expectAccount(statusBloc.account, status.account);

    var newValue = await createTestAccount(seed: "seed3");

    var listenedValue;

    var subscription = statusBloc.accountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectAccount(listenedValue, status.account);

    await _update(status.copyWith(account: newValue));

    expectAccount(statusBloc.account, newValue);
    expectAccount(listenedValue, newValue);
    subscription.cancel();
  });

  test('reblogOrOriginalAccount', () async {
    expectAccount(statusBloc.reblogOrOriginalAccount, status.account);

    var reblog = await createTestStatus(seed: "accountReblogOrOriginal");

    var reblogValue = await createTestAccount(seed: "reblog");
    var newValue = await createTestAccount(seed: "test");

    var listenedValue;

    var subscription =
        statusBloc.reblogOrOriginalAccountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectAccount(listenedValue, status.account);

    await _update(
        status.copyWith(reblog: reblog.copyWith(account: reblogValue)));

    expectAccount(statusBloc.reblogOrOriginalAccount, reblogValue);
    expectAccount(listenedValue, reblogValue);

    await _update(status.copyWith(
        account: newValue, reblog: reblog.copyWith(account: reblogValue)));

    expectAccount(statusBloc.reblogOrOriginalAccount, reblogValue);
    expectAccount(listenedValue, reblogValue);
    subscription.cancel();
  });

  test('reblogged', () async {
    expect(statusBloc.reblogged, status.reblogged);

    var newValue = !status.reblogged;

    var listenedValue;

    var subscription = statusBloc.rebloggedStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.reblogged);

    await _update(status.copyWith(reblogged: newValue));

    expect(statusBloc.reblogged, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
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
    expect(listenedValue, status.favourited);

    await _update(status.copyWith(favourited: newValue));

    expect(statusBloc.favourited, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('isHaveInReplyToAccount', () async {
    expect(statusBloc.isHaveInReplyToAccount,
        status.inReplyToAccountRemoteId?.isNotEmpty == true);

    var newValue = "inReplyToRemoteId";

    var listenedValue;

    var subscription =
        statusBloc.isHaveInReplyToAccountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.inReplyToAccountRemoteId?.isNotEmpty == true);

    await _update(status.copyWith(inReplyToRemoteId: newValue));

    expect(statusBloc.isHaveInReplyToAccount, true);
    expect(listenedValue, true);
    subscription.cancel();
  });

  test('isHaveReblog', () async {
    expect(statusBloc.isHaveReblog, status.reblog != null);

    var reblog = await createTestStatus(seed: "isHaveReblog");

    var listenedValue;

    var subscription = statusBloc.isHaveReblogStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.reblog != null);

    await _update(status.copyWith(reblog: reblog));

    expect(statusBloc.isHaveReblog, true);
    expect(listenedValue, true);

    subscription.cancel();
  });

  test('mediaAttachments', () async {
    expect(statusBloc.mediaAttachments, status.mediaAttachments);

    var newValue = [PleromaMediaAttachment(previewUrl: "previewUrl")];

    var listenedValue;

    var subscription = statusBloc.mediaAttachmentsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.mediaAttachments);

    await _update(status.copyWith(mediaAttachments: newValue));

    expect(statusBloc.mediaAttachments, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('emojiReactions', () async {
    expect(statusBloc.pleromaEmojiReactions, status.pleromaEmojiReactions);

    var newValue = [
      PleromaStatusEmojiReaction(name: "newName", count: 1, me: true)
    ];

    var listenedValue;

    var subscription =
        statusBloc.pleromaEmojiReactionsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.pleromaEmojiReactions);

    await _update(status.copyWith(pleromaEmojiReactions: newValue));

    expect(statusBloc.pleromaEmojiReactions, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('reblogPlusOriginalEmojiReactions', () async {
    expect(statusBloc.reblogPlusOriginalPleromaEmojiReactions,
        status.pleromaEmojiReactions);

    var reblog =
        await createTestStatus(seed: "reblogPlusOriginalEmojiReactions");

    var reblogEmojiAccount =
        await createTestAccount(seed: "reblogEmojiAccount");
    var emojiAccount = await createTestAccount(seed: "emojiAccount");

    var reblogValue = [
      PleromaStatusEmojiReaction(
          name: "emoji",
          count: 2,
          me: false,
          accounts: [mapLocalAccountToRemoteAccount(reblogEmojiAccount)]),
      PleromaStatusEmojiReaction(
          name: "emojiReblog", count: 1, me: true, accounts: [])
    ];
    var newValue = [
      PleromaStatusEmojiReaction(
          name: "emoji",
          count: 3,
          me: true,
          accounts: [mapLocalAccountToRemoteAccount(emojiAccount)]),
      PleromaStatusEmojiReaction(
          name: "emojiOriginal", count: 1, me: true, accounts: [])
    ];

    var listenedValue;

    var subscription =
        statusBloc.reblogPlusOriginalEmojiReactionsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.pleromaEmojiReactions);

    await _update(status.copyWith(pleromaEmojiReactions: newValue));

    expect(statusBloc.reblogPlusOriginalPleromaEmojiReactions[0], newValue[0]);
    expect(statusBloc.reblogPlusOriginalPleromaEmojiReactions[1], newValue[1]);
    expect(statusBloc.reblogPlusOriginalPleromaEmojiReactions, newValue);
    expect(listenedValue, newValue);

    await _update(status.copyWith(
        pleromaEmojiReactions: newValue,
        reblog: reblog.copyWith(pleromaEmojiReactions: reblogValue)));

    var expected = [
      PleromaStatusEmojiReaction(
          name: "emojiOriginal", count: 1, me: true, accounts: []),
      PleromaStatusEmojiReaction(name: "emoji", count: 5, me: true, accounts: [
        mapLocalAccountToRemoteAccount(emojiAccount),
        mapLocalAccountToRemoteAccount(reblogEmojiAccount),
      ]),
      PleromaStatusEmojiReaction(
          name: "emojiReblog", count: 1, me: true, accounts: []),
    ];

    expect(statusBloc.reblogPlusOriginalPleromaEmojiReactions[0], expected[0]);
    expect(statusBloc.reblogPlusOriginalPleromaEmojiReactions[1], expected[1]);
    expect(statusBloc.reblogPlusOriginalPleromaEmojiReactions[2], expected[2]);
    expect(statusBloc.reblogPlusOriginalPleromaEmojiReactions, expected);

    expect(listenedValue[0], expected[0]);
    expect(listenedValue[1], expected[1]);
    expect(listenedValue[2], expected[2]);
    expect(listenedValue, expected);

    subscription.cancel();
  });

  test('accountAvatar', () async {
    expect(statusBloc.accountAvatar, status.account.avatar);

    var newValue = await createTestAccount(seed: "seed3");

    var listenedValue;

    var subscription = statusBloc.accountAvatarStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.account.avatar);

    await _update(status.copyWith(account: newValue));

    expect(statusBloc.accountAvatar, newValue.avatar);
    expect(listenedValue, newValue.avatar);
    subscription.cancel();
  });

  test('mentions', () async {
    expect(statusBloc.mentions, status.mentions);

    var newValue = [PleromaMention(username: "newUsername")];

    var listenedValue;

    var subscription = statusBloc.mentionsStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.mentions);

    await _update(status.copyWith(mentions: newValue));

    expect(statusBloc.mentions, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('spoilerText', () async {
    expect(statusBloc.spoilerText, status.spoilerText);

    var newValue = "newSpoilerText";

    var listenedValue;

    var subscription = statusBloc.spoilerTextStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.spoilerText);

    await _update(status.copyWith(spoilerText: newValue));

    expect(statusBloc.spoilerText, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('nsfwSensitive', () async {
    expect(statusBloc.nsfwSensitive, status.nsfwSensitive);

    var newValue = !statusBloc.nsfwSensitive;

    var listenedValue;

    var subscription = statusBloc.nsfwSensitiveStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.nsfwSensitive);

    await _update(status.copyWith(nsfwSensitive: newValue));

    expect(statusBloc.nsfwSensitive, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('nsfwSensitiveAndDisplayEnabled', () async {
    var listenedValue;

    var subscription =
        statusBloc.nsfwSensitiveAndDisplayEnabledStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    await _update(status.copyWith(nsfwSensitive: true));

    expect(statusBloc.nsfwSensitiveAndDisplayEnabled, false);
    expect(listenedValue, false);

    statusBloc.changeDisplayNsfwSensitive(true);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(statusBloc.nsfwSensitiveAndDisplayEnabled, true);
    expect(listenedValue, true);

    statusBloc.changeDisplayNsfwSensitive(false);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(statusBloc.nsfwSensitiveAndDisplayEnabled, false);
    expect(listenedValue, false);

    subscription.cancel();
  });

  test('containsSpoiler', () async {
    expect(statusBloc.containsSpoiler, status.spoilerText?.isNotEmpty == true);

    var newValue = "newSpoilerText";

    var listenedValue;

    var subscription = statusBloc.containsSpoilerStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.spoilerText?.isNotEmpty == true);

    await _update(status.copyWith(spoilerText: newValue));

    expect(statusBloc.containsSpoiler, true);
    expect(listenedValue, true);

    await _update(status.copyWith(spoilerText: ""));

    expect(statusBloc.containsSpoiler, false);
    expect(listenedValue, false);
    subscription.cancel();
  });
  test('containsSpoilerAndDisplayEnabled', () async {
    var listenedValue;

    var subscription =
        statusBloc.containsSpoilerAndDisplayEnabledStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    await _update(status.copyWith(spoilerText: "newSpoilerText"));

    expect(statusBloc.containsSpoilerAndDisplayEnabled, false);
    expect(listenedValue, false);

    statusBloc.changeDisplaySpoiler(true);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(statusBloc.containsSpoilerAndDisplayEnabled, true);
    expect(listenedValue, true);

    statusBloc.changeDisplaySpoiler(false);
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expect(statusBloc.containsSpoilerAndDisplayEnabled, false);
    expect(listenedValue, false);

    subscription.cancel();
  });

  test('createdAt', () async {
    expect(statusBloc.createdAt, status.createdAt);

    var newValue = DateTime(1990);

    var listenedValue;

    var subscription = statusBloc.createdAtStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.createdAt);

    await _update(status.copyWith(createdAt: newValue));

    expect(statusBloc.createdAt, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('favouritesCount', () async {
    expect(statusBloc.favouritesCount, status.favouritesCount);

    var newValue = 3;

    var listenedValue;

    var subscription = statusBloc.favouritesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.favouritesCount);

    await _update(status.copyWith(favouritesCount: newValue));

    expect(statusBloc.favouritesCount, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('reblogPlusOriginalFavouritesCount', () async {
    expect(
        statusBloc.reblogPlusOriginalFavouritesCount, status.favouritesCount);

    var reblogValue = 4;
    var newValue = 3;

    var reblog = await createTestStatus(seed: "favouritesCount");

    var listenedValue;

    var subscription =
        statusBloc.reblogPlusOriginalFavouritesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.favouritesCount);

    await _update(status.copyWith(favouritesCount: newValue));

    expect(statusBloc.reblogPlusOriginalFavouritesCount, newValue);
    expect(listenedValue, newValue);

    await _update(status.copyWith(
        favouritesCount: newValue,
        reblog: reblog.copyWith(favouritesCount: reblogValue)));

    expect(
        statusBloc.reblogPlusOriginalFavouritesCount, newValue + reblogValue);
    expect(listenedValue, newValue + reblogValue);

    subscription.cancel();
  });

  test('reblogsCount', () async {
    expect(statusBloc.reblogsCount, status.reblogsCount);

    var newValue = 3;

    var listenedValue;

    var subscription = statusBloc.reblogsCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.reblogsCount);

    await _update(status.copyWith(reblogsCount: newValue));

    expect(statusBloc.reblogsCount, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('reblogPlusOriginalReblogsCount', () async {
    expect(statusBloc.reblogPlusOriginalReblogsCount, status.reblogsCount);

    var reblogValue = 4;
    var newValue = 3;

    var reblog = await createTestStatus(seed: "reblogsCount");

    var listenedValue;

    var subscription =
        statusBloc.reblogPlusOriginalReblogsCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.reblogsCount);

    await _update(status.copyWith(reblogsCount: newValue));

    expect(statusBloc.reblogPlusOriginalReblogsCount, newValue);
    expect(listenedValue, newValue);

    await _update(status.copyWith(
        reblogsCount: newValue,
        reblog: reblog.copyWith(reblogsCount: reblogValue)));

    expect(statusBloc.reblogPlusOriginalReblogsCount, newValue + reblogValue);
    expect(listenedValue, newValue + reblogValue);

    subscription.cancel();
  });

  test('repliesCount', () async {
    expect(statusBloc.repliesCount, status.repliesCount);

    var newValue = 3;

    var listenedValue;

    var subscription = statusBloc.repliesCountStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, status.repliesCount);

    await _update(status.copyWith(repliesCount: newValue));

    expect(statusBloc.repliesCount, newValue);
    expect(listenedValue, newValue);
    subscription.cancel();
  });

  test('refreshFromNetwork', () async {
    expectStatus(statusBloc.status, status);

    var id = await statusRepository.upsertRemoteStatus(
        mapLocalStatusToRemoteStatus(status),
        listRemoteId: null,
        conversationRemoteId: null);
    status = status.copyWith(id: id);

    var newValue =
        await createTestStatus(seed: "seed2", remoteId: status.remoteId);

    var listenedValue;

    var subscription = statusBloc.statusStream.listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expectStatus(listenedValue, status);

    when(pleromaStatusServiceMock.getStatus(statusRemoteId: status.remoteId))
        .thenAnswer((_) async => mapLocalStatusToRemoteStatus(newValue));

    await statusBloc.refreshFromNetwork();
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));

    expectStatus(listenedValue, newValue);
    subscription.cancel();
  });

  test('loadAccountByMentionUrl', () async {
    var accountId1 = "accountId1";
    await _update(status.copyWith(mentions: [
      PleromaMention(
          id: accountId1, url: "url1", acct: "acct1", username: "name1"),
      PleromaMention(
          id: "accountId2", url: "url2", acct: "acct2", username: "name2")
    ]));

    var account = await createTestAccount(
        seed: "loadAccountByMentionUrl", remoteId: accountId1);

    when(pleromaAccountServiceMock.getAccount(accountRemoteId: accountId1))
        .thenAnswer((_) async => mapLocalAccountToRemoteAccount(account));

    expect(await statusBloc.loadAccountByMentionUrl(url: "invalid url"), null);
    expectAccount(
        await statusBloc.loadAccountByMentionUrl(url: "url1"), account);
  });

  test('inReplyToAccount', () async {
    var account1 = await createTestAccount(seed: "inReplyToAccount");

    await accountRepository.upsertRemoteAccount(
        mapLocalAccountToRemoteAccount(account1),
        conversationRemoteId: null);

    expectAccount(await statusBloc.loadInReplyToAccount(), null);

    var listenedValue;
    var subscription = statusBloc.watchInReplyToAccount().listen((newValue) {
      listenedValue = newValue;
    });
    // hack to execute notify callbacks
    await Future.delayed(Duration(milliseconds: 1));
    expect(listenedValue, null);

    await _update(status.copyWith(inReplyToAccountRemoteId: account1.remoteId));

    expectAccount(await statusBloc.loadInReplyToAccount(), account1);

    subscription.cancel();
  });

  test('loadFavouritedByAccounts', () async {
    throw "Not implemented yet";
//    var account1 = await createTestAccount(seed: "loadFavouritedByAccounts1");
//    var account2 = await createTestAccount(seed: "loadFavouritedByAccounts2");
//
//    await _update(status);
//
//    expect(await statusBloc.loadFavouritedByAccounts(), []);
//
//
//    when(pleromaAccountServiceMock.getAccount(accountRemoteId: accountId1))
//        .thenAnswer((_) async => mapLocalAccountToRemoteAccount(account));
//
//    await accountRepository.updateStatusFavouritedBy(
//        statusRemoteId: status.remoteId,
//        favouritedByAccounts: [
//          mapLocalAccountToRemoteAccount(account1),
//          mapLocalAccountToRemoteAccount(account2),
//        ]);
//
//    await accountRepository.upsertRemoteAccount(
//        mapLocalAccountToRemoteAccount(account1),
//        conversationRemoteId: null);
//
//    expect((await statusBloc.loadFavouritedByAccounts()).length, 2);
  });

  test('loadReblogedByAccounts', () async {
    throw "Not implemented yet";
  });

  test('requestToggleReblog', () async {
    throw "Not implemented yet";
  });

  test('requestToggleFavourite', () async {
    throw "Not implemented yet";
  });

  test('requestToggleMute', () async {
    throw "Not implemented yet";
  });

  test('requestToggleBookmark', () async {
    throw "Not implemented yet";
  });

  test('requestTogglePin', () async {
    throw "Not implemented yet";
  });
  test('requestToggleEmojiReaction', () async {
    throw "Not implemented yet";
  });
}
