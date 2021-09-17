import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../account/database/account_database_test_helper.dart';
import 'package:unifedi_api/unifedi_api_mock_helper.dart';

// ignore_for_file: no-magic-number

class StatusDatabaseMockHelper {
  static Future<DbStatusPopulated> createTestDbStatusPopulated(
    DbStatus dbStatus,
    AccountRepository accountRepository,
  ) async {
    var dbStatusPopulated = DbStatusPopulated(
      dbStatus: dbStatus,
      dbAccount: (await accountRepository
          .findByRemoteIdInDbType(dbStatus.accountRemoteId))!,
      reblogDbStatus: null,
      reblogDbStatusAccount: null,
      replyReblogDbStatus: null,
      replyDbStatusAccount: null,
      replyReblogDbStatusAccount: null,
      replyDbStatus: null,
    );

    return dbStatusPopulated;
  }

  static Future<DbStatus> createTestDbStatus({
    required String seed,
    DateTime? createdAt,
    required DbAccount dbAccount,
    bool? threadMuted = false,
    String? remoteId,
    String? inReplyToAccountRemoteId = 'inReplyToAccountRemoteId',
  }) async {
    var dbStatus = DbStatus(
      id: null,
      remoteId: remoteId ?? seed + 'remoteId',
      createdAt: createdAt ?? DateTime(1),
      inReplyToRemoteId: seed + 'inReplyToRemoteId',
      inReplyToAccountRemoteId: inReplyToAccountRemoteId,
      sensitive: true,
      spoilerText: seed + 'spoilerText',
      visibility: UnifediApiVisibility.publicValue,
      uri: seed + 'uri',
      url: seed + 'url',
      repliesCount: 3,
      reblogsCount: 4,
      favouritesCount: 5,
      favourited: true,
      reblogged: false,
      pinned: false,
      muted: false,
      bookmarked: false,
      content: seed + 'content',
      reblogStatusRemoteId: null,
      application:
          UnifediApiApplicationMockHelper.generate(
        seed: seed,
      ),
      accountRemoteId: dbAccount.remoteId,
      mediaAttachments: null,
      mentions: null,
      tags: null,
      emojis: null,
      poll: null,
      card: null,
      language: seed + 'language',
      contentVariants: null,
      conversationId: null,
      directConversationId: null,
      inReplyToAccountAcct: null,
      local: true,
      spoilerTextVariants: null,
      expiresAt: DateTime(6),
      threadMuted: threadMuted,
      emojiReactions: null,
    );

    return dbStatus;
  }

  static Future<UnifediApiStatus> createTestRemoteStatus({
    required String seed,
    DateTime? createdAt,
    required DbAccount dbAccount,
    bool threadMuted = false,
    String? remoteId,
    required AccountRepository accountRepository,
  }) async {
    var dbStatus = await StatusDatabaseMockHelper.createTestDbStatus(
      seed: seed,
      dbAccount: dbAccount,
      createdAt: createdAt,
      threadMuted: threadMuted,
      remoteId: remoteId,
    );
    var dbStatusPopulated =
        await StatusDatabaseMockHelper.createTestDbStatusPopulated(
      dbStatus,
      accountRepository,
    );

    return DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
        .toUnifediApiStatus();
  }

  static void expectDbStatusPopulated(
    IStatus? actual,
    DbStatusPopulated? expected,
  ) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual!.localId != null, true);
    var dbStatus = expected!.dbStatus;
    StatusDatabaseMockHelper.expectDbStatus(actual, dbStatus);

    AccountDatabaseMockHelper.expectDbAccount(
      actual.account,
      expected.dbAccount,
    );
    StatusDatabaseMockHelper.expectDbStatus(
      actual.reblog,
      expected.reblogDbStatus,
    );
    AccountDatabaseMockHelper.expectDbAccount(
      actual.reblog?.account,
      expected.reblogDbStatusAccount,
    );
  }

  static void expectDbStatus(IStatus? actual, DbStatus? expected) {
    if (actual == null && expected == null) {
      return;
    }
    expect(actual != null, true);

    expect(actual!.remoteId, expected!.remoteId);

    expect(actual.createdAt, expected.createdAt);
    expect(actual.inReplyToRemoteId, expected.inReplyToRemoteId);
    expect(actual.inReplyToAccountRemoteId, expected.inReplyToAccountRemoteId);
    expect(actual.nsfwSensitive, expected.sensitive);
    expect(actual.spoilerText, expected.spoilerText);
    expect(actual.uri, expected.uri);
    expect(actual.url, expected.url);
    expect(actual.repliesCount, expected.repliesCount);
    expect(actual.reblogsCount, expected.reblogsCount);
    expect(actual.favouritesCount, expected.favouritesCount);
    expect(actual.favourited, expected.favourited);
    expect(actual.reblogged, expected.reblogged);
    expect(actual.bookmarked, expected.bookmarked);
    expect(actual.content, expected.content);
    expect(actual.reblogStatusRemoteId, expected.reblogStatusRemoteId);
    expect(actual.application, expected.application);
    expect(actual.mediaAttachments, expected.mediaAttachments);
    expect(actual.mentions, expected.mentions);
    expect(actual.tags, expected.tags);
    expect(actual.emojis, expected.emojis);
    expect(actual.poll, expected.poll);
    expect(actual.card, expected.card);
    expect(actual.visibility, expected.visibility);
    expect(actual.language, expected.language);

    expect(actual.contentVariants, expected.contentVariants);
    expect(actual.conversationId, expected.conversationId);
    expect(
      actual.directConversationId,
      expected.directConversationId,
    );
    expect(
      actual.inReplyToAccountAcct,
      expected.inReplyToAccountAcct,
    );
    expect(actual.local, expected.local);
    expect(actual.spoilerTextVariants, expected.spoilerTextVariants);
    expect(actual.expiresAt, expected.expiresAt);
    expect(actual.emojiReactions, expected.emojiReactions);
    expect(actual.threadMuted, expected.threadMuted);
  }
}
