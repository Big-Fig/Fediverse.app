import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:unifedi_api/unifedi_api.dart';

class PostStatusDataStatusStatusAdapter implements IStatus {
  @override
  final IAccount account;

  @override
  final DateTime createdAt;

  final PostStatusData postStatusData;

  @override
  final int? localId;

  @override
  final PendingState pendingState;

  @override
  final String? oldPendingRemoteId;

  @override
  final String? wasSentWithIdempotencyKey;

  PostStatusDataStatusStatusAdapter({
    required this.account,
    required this.postStatusData,
    required this.createdAt,
    required this.localId,
    required this.pendingState,
    required this.oldPendingRemoteId,
    required this.wasSentWithIdempotencyKey,
  });

  // we need unique not-null remoteId, because database schema require it
  DbStatus toDbStatus({
    required String fakeUniqueRemoteRemoteId,
  }) =>
      DbStatus(
        id: null,
        remoteId: fakeUniqueRemoteRemoteId,
        createdAt: createdAt,
        inReplyToRemoteId: inReplyToRemoteId,
        inReplyToAccountRemoteId: inReplyToAccountRemoteId,
        sensitive: nsfwSensitive,
        spoilerText: spoilerText,
        visibility: visibility,
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
        reblogStatusRemoteId: reblogStatusRemoteId,
        application: application,
        accountRemoteId: account.remoteId,
        mediaAttachments: mediaAttachments,
        mentions: mentions,
        tags: tags,
        poll: poll,
        language: language,
        contentVariants: contentVariants,
        conversationId: conversationId,
        directConversationId: directConversationId,
        inReplyToAccountAcct: inReplyToAccountAcct,
        local: local,
        spoilerTextVariants: spoilerTextVariants,
        expiresAt: expiresAt,
        threadMuted: threadMuted,
        emojiReactions: emojiReactions,
        deleted: deleted,
        pendingState: pendingState,
        oldPendingRemoteId: oldPendingRemoteId,
        wasSentWithIdempotencyKey: wasSentWithIdempotencyKey,
        card: card,
        hiddenLocallyOnDevice: hiddenLocallyOnDevice,
        emojis: emojis,
      );

  @override
  UnifediApiApplication? get application => null;

  @override
  bool get bookmarked => false;

  @override
  UnifediApiCard? get card => null;

  @override
  String? get content => postStatusData.text;

  @override
  List<UnifediApiEmoji> get emojis => [];

  @override
  bool get favourited => false;

  @override
  int get favouritesCount => 0;

  @override
  String? get inReplyToAccountRemoteId =>
      postStatusData.inReplyToUnifediApiStatus?.account.id;

  @override
  String? get inReplyToRemoteId => postStatusData.inReplyToUnifediApiStatus?.id;

  @override
  String? get language => postStatusData.language;

  @override
  List<UnifediApiMention> get mentions => [];

  @override
  bool get muted => false;

  @override
  bool get nsfwSensitive => postStatusData.isNsfwSensitiveEnabled;

  @override
  bool get pinned => false;

  @override
  UnifediApiContentVariants? get contentVariants => null;

  @override
  int? get conversationId => null;

  @override
  int? get directConversationId => null;

  @override
  List<UnifediApiEmojiReaction>? get emojiReactions => null;

  @override
  DateTime? get expiresAt => null;

  @override
  String? get inReplyToAccountAcct => null;

  @override
  bool? get local => null;

  @override
  UnifediApiContentVariants? get spoilerTextVariants => null;

  @override
  bool? get threadMuted => null;

  @override
  UnifediApiPoll? get poll => postStatusData.poll?.toUnifediApiPoll();

  @override
  IStatus? get reblog => null;

  @override
  String? get reblogStatusRemoteId => null;

  @override
  bool get reblogged => false;

  @override
  int get reblogsCount => 0;

  @override
  String? get remoteId => null;

  @override
  int get repliesCount => 0;

  @override
  String get spoilerText => postStatusData.subject ?? '';

  @override
  List<UnifediApiTag> get tags => [];

  @override
  String get uri => '';

  @override
  String get url => '';

  @override
  UnifediApiVisibility get visibility => postStatusData.visibilityPleroma;

  @override
  IStatus? get inReplyToStatus =>
      postStatusData.inReplyToUnifediApiStatus?.toDbStatusPopulatedWrapper();

  @override
  List<UnifediApiMediaAttachment>? get mediaAttachments =>
      postStatusData.mediaAttachments;

  @override
  bool get deleted => false;

  @override
  bool get hiddenLocallyOnDevice => false;

  @override
  int compareTo(IStatus b) => IStatus.compareItemsToSort(this, b);

  @override
  bool isEqualTo(IStatus b) => IStatus.isItemsEqual(this, b);
}
