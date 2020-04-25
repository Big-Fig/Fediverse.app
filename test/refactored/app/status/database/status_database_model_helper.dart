import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../pleroma/application/pleroma_application_model_helper.dart';
import '../../account/database/account_database_model_helper.dart';

Future<DbStatus> createTestDbStatus({
  @required String seed,
  @required DbAccount dbAccount,
  bool pleromaThreadMuted = false,
  String remoteId,
}) async {
  DbStatus dbStatus = DbStatus(
      id: null,
      remoteId: remoteId ?? seed + "remoteId",
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
      pinned: false,
      muted: true,
      bookmarked: false,
      content: seed + "content",
      reblogStatusRemoteId: null,
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
      pleromaThreadMuted: pleromaThreadMuted,
      pleromaEmojiReactions: null);
  return dbStatus;
}

expectDbStatusPopulated(IStatus actual, DbStatusPopulated expected) {
  if (actual == null && expected == null) {
    return;
  }

  expect(actual.localId != null, true);
  var dbStatus = expected.dbStatus;
  expectDbStatus(actual, dbStatus);

  expectDbAccount(actual.account, expected.dbAccount);
  expectDbStatus(actual.reblog, expected.reblogDbStatus);
  expectDbAccount(actual.reblog?.account, expected.reblogDbStatusAccount);
}

void expectDbStatus(IStatus actual, DbStatus expected) {
  if (actual == null && expected == null) {
    return;
  }
  expect(actual != null, true);

  expect(actual.remoteId, expected.remoteId);

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
      actual.pleromaDirectConversationId, expected.pleromaDirectConversationId);
  expect(
      actual.pleromaInReplyToAccountAcct, expected.pleromaInReplyToAccountAcct);
  expect(actual.pleromaLocal, expected.pleromaLocal);
  expect(actual.pleromaSpoilerText, expected.pleromaSpoilerText);
  expect(actual.pleromaExpiresAt, expected.pleromaExpiresAt);
  expect(actual.pleromaEmojiReactions, expected.pleromaEmojiReactions);
  expect(actual.pleromaThreadMuted, expected.pleromaThreadMuted);
}
