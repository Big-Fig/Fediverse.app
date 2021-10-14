import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../account/account_test_helper.dart';
import 'database/status_database_test_helper.dart';

class StatusMockHelper {
  static Future<DbStatusPopulatedWrapper> createTestStatus({
    required String seed,
    String? remoteId,
    DateTime? createdAt,
    DbAccountPopulatedWrapper? account,
    DbStatusPopulatedWrapper? reblog,
    DbStatusPopulatedWrapper? reply,
  }) async {
    var actualAccount =
        account ?? await AccountMockHelper.createTestAccount(seed: seed);
    var dbAccount = actualAccount.toDbAccount();

    return DbStatusPopulatedWrapper(
      dbStatusPopulated: DbStatusPopulated(
        dbStatus: await StatusDatabaseMockHelper.createTestDbStatus(
          createdAt: createdAt,
          seed: seed,
          remoteId: remoteId,
          dbAccount: dbAccount,
        ),
        dbAccount: dbAccount,
        reblogDbStatus: reblog?.dbStatusPopulated.dbStatus,
        reblogDbStatusAccount: reblog?.dbStatusPopulated.dbAccount,
        replyDbStatus: reply?.dbStatusPopulated.dbStatus,
        replyDbStatusAccount: reply?.dbStatusPopulated.dbAccount,
        replyReblogDbStatus: reply?.dbStatusPopulated.reblogDbStatus,
        replyReblogDbStatusAccount:
            reply?.dbStatusPopulated.reblogDbStatusAccount,
      ),
    );
  }

  static void expectStatus(IStatus? actual, IStatus? expected) {
    if (actual == null && expected == null) {
      return;
    }

    expect(actual != null, true);

    expect(
      actual!.remoteId,
      expected!.remoteId,
    );

    expect(
      actual.createdAt,
      expected.createdAt,
    );
    expect(
      actual.inReplyToRemoteId,
      expected.inReplyToRemoteId,
    );
    expect(
      actual.inReplyToAccountRemoteId,
      expected.inReplyToAccountRemoteId,
    );
    expect(
      actual.nsfwSensitive,
      expected.nsfwSensitive,
    );
    expect(
      actual.spoilerText,
      expected.spoilerText,
    );
    expect(
      actual.uri,
      expected.uri,
    );
    expect(
      actual.url,
      expected.url,
    );
    expect(
      actual.repliesCount,
      expected.repliesCount,
    );
    expect(
      actual.reblogsCount,
      expected.reblogsCount,
    );
    expect(
      actual.favouritesCount,
      expected.favouritesCount,
    );
    expect(
      actual.favourited,
      expected.favourited,
    );
    expect(
      actual.reblogged,
      expected.reblogged,
    );
    expect(
      actual.bookmarked,
      expected.bookmarked,
    );
    expect(
      actual.content,
      expected.content,
    );
    expect(
      actual.reblogStatusRemoteId,
      expected.reblogStatusRemoteId,
    );
    expect(
      actual.application,
      expected.application,
    );
    expect(
      actual.mediaAttachments,
      expected.mediaAttachments,
    );
    expect(
      actual.mentions,
      expected.mentions,
    );
    expect(
      actual.tags,
      expected.tags,
    );
    expect(
      actual.emojis,
      expected.emojis,
    );
    expect(
      actual.poll,
      expected.poll,
    );
    expect(
      actual.card,
      expected.card,
    );
    expect(
      actual.visibility,
      expected.visibility,
    );
    expect(
      actual.language,
      expected.language,
    );

    expect(
      actual.contentVariants,
      expected.contentVariants,
    );
    expect(
      actual.conversationId,
      expected.conversationId,
    );
    expect(
      actual.directConversationId,
      expected.directConversationId,
    );
    expect(
      actual.inReplyToAccountAcct,
      expected.inReplyToAccountAcct,
    );
    expect(
      actual.local,
      expected.local,
    );
    expect(
      actual.spoilerTextVariants,
      expected.spoilerTextVariants,
    );
    expect(
      actual.expiresAt,
      expected.expiresAt,
    );
    expect(
      actual.emojiReactions,
      expected.emojiReactions,
    );
    expect(
      actual.threadMuted,
      expected.threadMuted,
    );

    AccountMockHelper.expectAccount(
      actual.account,
      expected.account,
    );
    StatusMockHelper.expectStatus(
      actual.reblog,
      expected.reblog,
    );
  }
}
