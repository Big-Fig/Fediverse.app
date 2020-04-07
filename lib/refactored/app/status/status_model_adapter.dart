import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/database/app_database.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_model_adapter.dart");

DbStatusPopulatedWrapper mapRemoteStatusToLocalStatus(
    IPleromaStatus remoteStatus) {
  DbStatus rebloggedStatus;
  DbAccount rebloggedStatusAccount;
  if (remoteStatus.reblog != null) {
    rebloggedStatus = mapRemoteStatusToDbStatus(remoteStatus.reblog);
    rebloggedStatusAccount =
        mapRemoteAccountToDbAccount(remoteStatus.reblog.account);
  }
  return DbStatusPopulatedWrapper(DbStatusPopulated(
      status: mapRemoteStatusToDbStatus(remoteStatus),
      account: mapRemoteAccountToDbAccount(remoteStatus.account),
      rebloggedStatus: rebloggedStatus,
      rebloggedStatusAccount: rebloggedStatusAccount));
}

DbStatus mapRemoteStatusToDbStatus(IPleromaStatus remoteStatus) {
// TODO: fix when https://git.pleroma.social/pleroma/pleroma/issues/1573  will be resolved
  DateTime expiresAt;
  try {
    if (remoteStatus.pleroma?.expiresAt == false ||
        remoteStatus.pleroma?.expiresAt == null) {
      expiresAt = null;
    } else {
      if (remoteStatus.pleroma?.expiresAt is DateTime) {
        expiresAt = remoteStatus.pleroma?.expiresAt;
      } else {
        expiresAt = DateTime.parse(remoteStatus.pleroma?.expiresAt);
      }
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
      pinned: remoteStatus.pinned,
      content: remoteStatus.content,
      reblogStatusRemoteId: remoteStatus.reblog?.id,
      application: remoteStatus.application,
      mediaAttachments: remoteStatus.mediaAttachments,
      mentions: remoteStatus.mentions,
      tags: remoteStatus.tags,
      emojis: remoteStatus.emojis,
      poll: remoteStatus.poll,
      card: remoteStatus.card,
      pleromaContent: remoteStatus.pleroma?.content,
      pleromaConversationId: remoteStatus.pleroma?.conversationId,
      pleromaDirectConversationId: remoteStatus.pleroma?.directConversationId,
      pleromaInReplyToAccountAcct: remoteStatus.pleroma?.inReplyToAccountAcct,
      pleromaLocal: remoteStatus.pleroma?.local,
      pleromaSpoilerText: remoteStatus.pleroma?.spoilerText,
      pleromaExpiresAt: expiresAt,
      pleromaThreadMuted: remoteStatus.pleroma?.threadMuted,
      pleromaEmojiReactions: remoteStatus.pleroma?.emojiReactions,
      accountRemoteId: remoteStatus.account.id);
}

// TODO: temporary solution for refactoring period
PleromaStatus mapLocalStatusToRemoteStatus(IStatus localStatus) {
  PleromaStatus reblog;
  if (localStatus.reblog != null) {
    reblog = mapLocalStatusToRemoteStatus(localStatus.reblog);
  }
  return PleromaStatus(
    id: localStatus.remoteId,
    createdAt: localStatus.createdAt,
    inReplyToId: localStatus.inReplyToRemoteId,
    inReplyToAccountId: localStatus.inReplyToAccountRemoteId,
    sensitive: localStatus.sensitive,
    spoilerText: localStatus.spoilerText,
    visibility: pleromaVisibilityValues.reverse[localStatus.visibility],
    uri: localStatus.uri,
    url: localStatus.url,
    repliesCount: localStatus.repliesCount,
    reblogsCount: localStatus.reblogsCount,
    favouritesCount: localStatus.favouritesCount,
    favourited: localStatus.favourited,
    reblogged: localStatus.reblogged,
    muted: localStatus.muted,
    bookmarked: localStatus.bookmarked,
    pinned: localStatus.pinned,
    content: localStatus.content,
    reblog: reblog,
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
