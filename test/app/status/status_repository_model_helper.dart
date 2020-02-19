import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../pleroma/application/pleroma_application_model_helper.dart';
import '../account/account_repository_model_helper.dart';

Future<DbStatus> createTestStatus(String seed, DbAccount dbAccount) async {
  DbStatus dbStatus = DbStatus(
      id: null,
      remoteId: seed + "remoteId",
      createdAt: DateTime(1),
      inReplyToRemoteId: seed + "inReplyToRemoteId",
      inReplyToAccountRemoteId: seed + "inReplyToAccountRemoteId",
      sensitive: true,
      spoilerText: seed + "spoilerText",
      visibility: PleromaVisibility.PUBLIC,
      uri: seed + "uri",
      url: seed + "url",
      repliesCount: 3,
      reblogsCount: 4,
      favouritesCount: 5,
      favourited: true,
      reblogged: false,
      muted: true,
      bookmarked: false,
      content: seed + "content",
      reblog: null,
      application: createTestPleromaApplication(seed),
      accountRemoteId: dbAccount.remoteId,
      mediaAttachments: null,
      mentions: null,
      tags: null,
      emojis: null,
      poll: null,
      card: null,
      language: seed + "language",
      pleromaContent: null,
      pleromaConversationId: null,
      pleromaDirectConversationId: null,
      pleromaInReplyToAccountAcct: null,
      pleromaLocal: true,
      pleromaSpoilerText: null,
      pleromaExpiresAt: DateTime(6),
      pleromaThreadMuted: false,
      pleromaEmojiReactions: null);
  return dbStatus;
}

expectDbStatusPopulated(IStatus actual, DbStatusPopulated expected) {
  expect(actual.localId != null, true);
  var dbStatus = expected.status;
  expectDbStatus(actual, dbStatus);

  expectDbAccount(actual.account, expected.account);
}

void expectDbStatus(IStatus actual, DbStatus dbStatus) {
  expect(actual.remoteId, dbStatus.remoteId);

  expect(actual.createdAt, dbStatus.createdAt);
  expect(actual.inReplyToRemoteId, dbStatus.inReplyToRemoteId);
  expect(actual.inReplyToAccountRemoteId, dbStatus.inReplyToAccountRemoteId);
  expect(actual.sensitive, dbStatus.sensitive);
  expect(actual.spoilerText, dbStatus.spoilerText);
  expect(actual.uri, dbStatus.uri);
  expect(actual.url, dbStatus.url);
  expect(actual.repliesCount, dbStatus.repliesCount);
  expect(actual.reblogsCount, dbStatus.reblogsCount);
  expect(actual.favouritesCount, dbStatus.favouritesCount);
  expect(actual.favourited, dbStatus.favourited);
  expect(actual.reblogged, dbStatus.reblogged);
  expect(actual.bookmarked, dbStatus.bookmarked);
  expect(actual.content, dbStatus.content);
  expect(actual.reblog, dbStatus.reblog);
  expect(actual.application, dbStatus.application);
  expect(actual.mediaAttachments, dbStatus.mediaAttachments);
  expect(actual.mentions, dbStatus.mentions);
  expect(actual.tags, dbStatus.tags);
  expect(actual.emojis, dbStatus.emojis);
  expect(actual.poll, dbStatus.poll);
  expect(actual.card, dbStatus.card);
  expect(actual.visibility, dbStatus.visibility);
  expect(actual.language, dbStatus.language);

  expect(actual.pleromaContent, dbStatus.pleromaContent);
  expect(actual.pleromaConversationId, dbStatus.pleromaConversationId);
  expect(
      actual.pleromaDirectConversationId, dbStatus.pleromaDirectConversationId);
  expect(
      actual.pleromaInReplyToAccountAcct, dbStatus.pleromaInReplyToAccountAcct);
  expect(actual.pleromaLocal, dbStatus.pleromaLocal);
  expect(actual.pleromaSpoilerText, dbStatus.pleromaSpoilerText);
  expect(actual.pleromaExpiresAt, dbStatus.pleromaExpiresAt);
  expect(actual.pleromaEmojiReactions, dbStatus.pleromaEmojiReactions);
  expect(actual.pleromaThreadMuted, dbStatus.pleromaThreadMuted);
}
