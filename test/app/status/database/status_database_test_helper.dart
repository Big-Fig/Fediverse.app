import 'package:fedi/app/account/repository/account_repository_impl.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../pleroma/api/application/pleroma_api_application_test_helper.dart';
import '../../account/database/account_database_test_helper.dart';

// ignore_for_file: no-magic-number

class StatusDatabaseTestHelper {
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
    bool? pleromaThreadMuted = false,
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
      visibility: PleromaApiVisibility.public,
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
          PleromaApiApplicationTestHelper.createTestPleromaApiApplication(
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
      pleromaContent: null,
      pleromaConversationId: null,
      pleromaDirectConversationId: null,
      pleromaInReplyToAccountAcct: null,
      pleromaLocal: true,
      pleromaSpoilerText: null,
      pleromaExpiresAt: DateTime(6),
      pleromaThreadMuted: pleromaThreadMuted,
      pleromaEmojiReactions: null,
    );

    return dbStatus;
  }

  static Future<PleromaApiStatus> createTestRemoteStatus({
    required String seed,
    DateTime? createdAt,
    required DbAccount dbAccount,
    bool pleromaThreadMuted = false,
    String? remoteId,
    required AccountRepository accountRepository,
  }) async {
    var dbStatus = await StatusDatabaseTestHelper.createTestDbStatus(
      seed: seed,
      dbAccount: dbAccount,
      createdAt: createdAt,
      pleromaThreadMuted: pleromaThreadMuted,
      remoteId: remoteId,
    );
    var dbStatusPopulated =
        await StatusDatabaseTestHelper.createTestDbStatusPopulated(
      dbStatus,
      accountRepository,
    );

    return DbStatusPopulatedWrapper(dbStatusPopulated: dbStatusPopulated)
        .toPleromaApiStatus();
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
    StatusDatabaseTestHelper.expectDbStatus(actual, dbStatus);

    AccountDatabaseTestHelper.expectDbAccount(
      actual.account,
      expected.dbAccount,
    );
    StatusDatabaseTestHelper.expectDbStatus(
      actual.reblog,
      expected.reblogDbStatus,
    );
    AccountDatabaseTestHelper.expectDbAccount(
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

    expect(actual.pleromaContent, expected.pleromaContent);
    expect(actual.pleromaConversationId, expected.pleromaConversationId);
    expect(
      actual.pleromaDirectConversationId,
      expected.pleromaDirectConversationId,
    );
    expect(
      actual.pleromaInReplyToAccountAcct,
      expected.pleromaInReplyToAccountAcct,
    );
    expect(actual.pleromaLocal, expected.pleromaLocal);
    expect(actual.pleromaSpoilerText, expected.pleromaSpoilerText);
    expect(actual.pleromaExpiresAt, expected.pleromaExpiresAt);
    expect(actual.pleromaEmojiReactions, expected.pleromaEmojiReactions);
    expect(actual.pleromaThreadMuted, expected.pleromaThreadMuted);
  }
}
