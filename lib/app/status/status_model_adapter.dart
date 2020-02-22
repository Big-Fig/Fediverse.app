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
PleromaStatus mapLocalStatusToRemoteStatus(IStatus localStatus) {
  return PleromaStatus(
    id: localStatus.remoteId,
    createdAt: localStatus.createdAt,
    inReplyToId: localStatus.inReplyToRemoteId,
    inReplyToAccountId: localStatus.inReplyToAccountRemoteId,
    sensitive: localStatus.sensitive,
    spoilerText: localStatus.spoilerText,
    visibilityRaw: pleromaVisibilityValues.reverse[localStatus.visibility],
    uri: localStatus.uri,
    url: localStatus.url,
    repliesCount: localStatus.repliesCount,
    reblogsCount: localStatus.reblogsCount,
    favouritesCount: localStatus.favouritesCount,
    favourited: localStatus.favourited,
    reblogged: localStatus.reblogged,
    muted: localStatus.muted,
    bookmarked: localStatus.bookmarked,
    content: localStatus.content,
    reblog: localStatus.reblog,
    application: localStatus.application,
    mediaAttachments: localStatus.mediaAttachments,
    mentions: localStatus.mentions,
    tags: localStatus.tags,
    emojis: localStatus.emojis,
    poll: localStatus.poll,
    card: localStatus.card,
    account: mapLocalAccountToRemoteAccount(localStatus.account),
    pleroma: PleromaStatusPleromaPart(
      content: localStatus.pleromaContent,
      conversationId: localStatus.pleromaConversationId,
      directConversationId: localStatus.pleromaDirectConversationId,
      inReplyToAccountAcct: localStatus.pleromaInReplyToAccountAcct,
      local: localStatus.pleromaLocal,
      spoilerText: localStatus.pleromaSpoilerText,
      expiresAt: localStatus.pleromaExpiresAt,
      threadMuted: localStatus.pleromaThreadMuted,
      emojiReactions: localStatus.pleromaEmojiReactions,
    ),
  );
}
