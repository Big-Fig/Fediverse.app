
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/database/app_database.dart';

import '../../pleroma/application/pleroma_application_model_helper.dart';

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


