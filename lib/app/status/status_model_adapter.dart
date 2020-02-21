import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/Pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_model_adapter.dart");

DbStatus mapRemoteStatusToDbStatus(IPleromaStatus remoteStatus) {
// TODO: fix when https://git.pleroma.social/pleroma/pleroma/issues/1573  will be resolved
  DateTime expiresAt;
  try {
    if (remoteStatus.pleroma.expiresAt is DateTime) {
      expiresAt = remoteStatus.pleroma.expiresAt;
    } else {
      expiresAt = DateTime.parse(remoteStatus.pleroma.expiresAt);
    }
  } catch (e) {
    _logger.shout(() => "Error during parsing expiresAt $e");
  }
  return DbStatus(
      id: null,
      remoteId: remoteStatus.id,
      createdAt: remoteStatus.createdAt,
      inReplyToRemoteId: remoteStatus.inReplyToId,
      inReplyToAccountRemoteId: remoteStatus.inReplyToAccountId,
      sensitive: remoteStatus.sensitive,
      spoilerText: remoteStatus.spoilerText,
      visibility: remoteStatus.visibilityPleroma,
      uri: remoteStatus.uri,
      url: remoteStatus.url,
      repliesCount: remoteStatus.repliesCount,
      reblogsCount: remoteStatus.reblogsCount,
      favouritesCount: remoteStatus.favouritesCount,
      favourited: remoteStatus.favourited,
      reblogged: remoteStatus.reblogged,
      muted: remoteStatus.muted,
      bookmarked: remoteStatus.bookmarked,
      content: remoteStatus.content,
      reblog: remoteStatus.reblog,
      application: remoteStatus.application,
      mediaAttachments: remoteStatus.mediaAttachments,
      mentions: remoteStatus.mentions,
      tags: remoteStatus.tags,
      emojis: remoteStatus.emojis,
      poll: remoteStatus.poll,
      card: remoteStatus.card,
      pleromaContent: remoteStatus.pleroma.content,
      pleromaConversationId: remoteStatus.pleroma.conversationId,
      pleromaDirectConversationId: remoteStatus.pleroma.directConversationId,
      pleromaInReplyToAccountAcct: remoteStatus.pleroma.inReplyToAccountAcct,
      pleromaLocal: remoteStatus.pleroma.local,
      pleromaSpoilerText: remoteStatus.pleroma.spoilerText,
      pleromaExpiresAt: expiresAt,
      pleromaThreadMuted: remoteStatus.pleroma.threadMuted,
      pleromaEmojiReactions: remoteStatus.pleroma.emojiReactions,
      accountRemoteId: remoteStatus.account.id);
}

// TODO: temporary solution for refactoring period
PleromaStatus mapLocalStatusToRemoteStatus(IStatus remoteStatus) {
  return PleromaStatus(
    id: remoteStatus.remoteId,
    createdAt: remoteStatus.createdAt,
    inReplyToId: remoteStatus.inReplyToRemoteId,
    inReplyToAccountId: remoteStatus.inReplyToAccountRemoteId,
    sensitive: remoteStatus.sensitive,
    spoilerText: remoteStatus.spoilerText,
    visibilityRaw: pleromaVisibilityValues.reverse[remoteStatus.visibility],
    uri: remoteStatus.uri,
    url: remoteStatus.url,
    repliesCount: remoteStatus.repliesCount,
    reblogsCount: remoteStatus.reblogsCount,
    favouritesCount: remoteStatus.favouritesCount,
    favourited: remoteStatus.favourited,
    reblogged: remoteStatus.reblogged,
    muted: remoteStatus.muted,
    bookmarked: remoteStatus.bookmarked,
    content: remoteStatus.content,
    reblog: remoteStatus.reblog,
    application: remoteStatus.application,
    mediaAttachments: remoteStatus.mediaAttachments,
    mentions: remoteStatus.mentions,
    tags: remoteStatus.tags,
    emojis: remoteStatus.emojis,
    poll: remoteStatus.poll,
    card: remoteStatus.card,
    account: mapLocalAccountToRemoteAccount(remoteStatus.account),
    pleroma: PleromaStatusPleromaPart(
      content: remoteStatus.pleromaContent,
      conversationId: remoteStatus.pleromaConversationId,
      directConversationId: remoteStatus.pleromaDirectConversationId,
      inReplyToAccountAcct: remoteStatus.pleromaInReplyToAccountAcct,
      local: remoteStatus.pleromaLocal,
      spoilerText: remoteStatus.pleromaSpoilerText,
      expiresAt: remoteStatus.pleromaExpiresAt,
      threadMuted: remoteStatus.pleromaThreadMuted,
      emojiReactions: remoteStatus.pleromaEmojiReactions,
    ),
  );
}
