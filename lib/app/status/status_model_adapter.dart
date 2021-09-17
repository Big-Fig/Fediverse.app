import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

extension PleromaStatusDbExtension on IUnifediApiStatus {
  DbStatusPopulatedWrapper toDbStatusPopulatedWrapper() {
    if (this is DbStatusPopulatedWrapper) {
      return this as DbStatusPopulatedWrapper;
    } else {
      return DbStatusPopulatedWrapper(
        dbStatusPopulated: toDbStatusPopulated(),
      );
    }
  }

  DbStatusPopulated toDbStatusPopulated() {
    if (this is DbStatusPopulatedWrapper) {
      return (this as DbStatusPopulatedWrapper).dbStatusPopulated;
    } else {
      return DbStatusPopulated(
        dbStatus: toDbStatus(),
        dbAccount: account.toDbAccount(),
        reblogDbStatus: reblog?.toDbStatus(),
        reblogDbStatusAccount: reblog?.account.toDbAccount(),
        replyReblogDbStatus: null,
        replyDbStatusAccount: null,
        replyReblogDbStatusAccount: null,
        replyDbStatus: null,
      );
    }
  }

  // ignore: code-metrics
  DbStatus toDbStatus() {
    var remoteStatus = this;

    return DbStatus(
      id: null,
      remoteId: remoteStatus.id,
      createdAt: remoteStatus.createdAt,
      inReplyToRemoteId: remoteStatus.inReplyToId,
      inReplyToAccountRemoteId: remoteStatus.inReplyToAccountId,
      sensitive: remoteStatus.sensitive,
      spoilerText: remoteStatus.spoilerText,
      visibility: remoteStatus.visibilityAsUnifediApi,
      uri: remoteStatus.uri,
      url: remoteStatus.url,
      repliesCount: remoteStatus.repliesCount ?? 0,
      reblogsCount: remoteStatus.reblogsCount ?? 0,
      favouritesCount: remoteStatus.favouritesCount ?? 0,
      favourited: remoteStatus.favourited ?? false,
      reblogged: remoteStatus.reblogged ?? false,
      muted: remoteStatus.muted ?? false,
      bookmarked: remoteStatus.bookmarked,
      pinned: remoteStatus.pinned,
      language: remoteStatus.language,
      content: remoteStatus.content,
      reblogStatusRemoteId: remoteStatus.reblog?.id,
      application: remoteStatus.application?.toUnifediApiApplication(),
      mediaAttachments:
          remoteStatus.mediaAttachments?.toUnifediApiMediaAttachmentList(),
      mentions: remoteStatus.mentions?.toUnifediApiMentionList(),
      tags: remoteStatus.tags?.toUnifediApiTagList(),
      emojis: remoteStatus.emojis?.toUnifediApiEmojiList(),
      poll: remoteStatus.poll?.toUnifediApiPoll(),
      card: remoteStatus.card?.toUnifediApiCard(),
      contentVariants: remoteStatus.contentVariants?.toUnifediApiContentVariants(),
      conversationId: remoteStatus.conversationId,
      directConversationId: remoteStatus.directConversationId,
      inReplyToAccountAcct: remoteStatus.inReplyToAccountAcct,
      local: remoteStatus.local,
      spoilerTextVariants: remoteStatus.spoilerTextVariants?.toUnifediApiContentVariants(),
      expiresAt: remoteStatus.expiresAt,
      threadMuted: remoteStatus.threadMuted,
      emojiReactions: remoteStatus.emojiReactions
          ?.toUnifediApiEmojiReactionList(),
      accountRemoteId: remoteStatus.account.id,
      // remote statuses always published
      pendingState: PendingState.published,
      wasSentWithIdempotencyKey: null,
      hiddenLocallyOnDevice: null,
      oldPendingRemoteId: null,
      deleted: null,
    );
  }
}

extension IStatusPleromaExtension on IStatus {


  UnifediApiStatus toUnifediApiStatus() {
    return UnifediApiStatus(
      id: remoteId!,
      createdAt: createdAt,
      inReplyToId: inReplyToRemoteId,
      inReplyToAccountId: inReplyToAccountRemoteId,
      sensitive: nsfwSensitive,
      spoilerText: spoilerText,
      visibility: visibility.stringValue,
      uri: uri,
      url: url,
      repliesCount: repliesCount,
      reblogsCount: reblogsCount,
      favouritesCount: favouritesCount,
      favourited: favourited,
      reblogged: reblogged,
      muted: muted,
      bookmarked: bookmarked,
      pinned: pinned,
      content: content,
      reblog: reblog?.toUnifediApiStatus(),
      language: language,
      application: application,
      mediaAttachments: mediaAttachments,
      mentions: mentions,
      tags: tags,
      emojis: emojis,
      poll: poll,
      card: card,
      account: account.toUnifediApiAccount(),
      contentVariants: contentVariants,
      conversationId: conversationId,
      directConversationId: directConversationId,
      inReplyToAccountAcct: inReplyToAccountAcct,
      local: local,
      spoilerTextVariants: spoilerTextVariants,
      expiresAt: expiresAt,
      threadMuted: threadMuted,
      emojiReactions: emojiReactions,
    );
  }
}
