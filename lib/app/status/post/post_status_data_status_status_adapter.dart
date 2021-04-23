import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/database/app_database.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/app/status/post/post_status_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/api/application/pleroma_api_application_model.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/content/pleroma_api_content_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/mention/pleroma_api_mention_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:fedi/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';

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
        pleromaContent: pleromaContent,
        pleromaConversationId: pleromaConversationId,
        pleromaDirectConversationId: pleromaDirectConversationId,
        pleromaInReplyToAccountAcct: pleromaInReplyToAccountAcct,
        pleromaLocal: pleromaLocal,
        pleromaSpoilerText: pleromaSpoilerText,
        pleromaExpiresAt: pleromaExpiresAt,
        pleromaThreadMuted: pleromaThreadMuted,
        pleromaEmojiReactions: pleromaEmojiReactions,
        deleted: deleted,
        pendingState: pendingState,
        oldPendingRemoteId: oldPendingRemoteId,
        wasSentWithIdempotencyKey: wasSentWithIdempotencyKey,
        card: card,
        hiddenLocallyOnDevice: hiddenLocallyOnDevice,
        emojis: emojis,
      );

  @override
  PleromaApplication? get application => null;

  @override
  bool get bookmarked => false;

  @override
  PleromaCard? get card => null;

  @override
  String? get content => postStatusData.text;

  @override
  List<PleromaEmoji> get emojis => [];

  @override
  bool get favourited => false;

  @override
  int get favouritesCount => 0;

  @override
  String? get inReplyToAccountRemoteId =>
      postStatusData.inReplyToPleromaStatus?.account.id;

  @override
  String? get inReplyToRemoteId => postStatusData.inReplyToPleromaStatus?.id;

  @override
  String? get language => postStatusData.language;

  @override
  List<PleromaMention> get mentions => [];

  @override
  bool get muted => false;

  @override
  bool get nsfwSensitive => postStatusData.isNsfwSensitiveEnabled;

  @override
  bool get pinned => false;

  @override
  PleromaContent? get pleromaContent => null;

  @override
  int? get pleromaConversationId => null;

  @override
  int? get pleromaDirectConversationId => null;

  @override
  List<PleromaStatusEmojiReaction>? get pleromaEmojiReactions => null;

  @override
  DateTime? get pleromaExpiresAt => null;

  @override
  String? get pleromaInReplyToAccountAcct => null;

  @override
  bool? get pleromaLocal => null;

  @override
  PleromaContent? get pleromaSpoilerText => null;

  @override
  bool? get pleromaThreadMuted => null;

  @override
  PleromaPoll? get poll => postStatusData.poll?.toPleromaPoll();

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
  String get spoilerText => postStatusData.subject ?? "";

  @override
  List<PleromaTag> get tags => [];

  @override
  String get uri => "";

  @override
  String get url => "";

  @override
  PleromaVisibility get visibility => postStatusData.visibilityPleroma;

  @override
  bool get isHaveReblog => false;

  @override
  bool get isReply => postStatusData.inReplyToPleromaStatus != null;

  @override
  IStatus? get inReplyToStatus =>
      postStatusData.inReplyToPleromaStatus?.toDbStatusPopulatedWrapper();

  @override
  List<PleromaMediaAttachment>? get mediaAttachments =>
      postStatusData.mediaAttachments;

  @override
  bool get deleted => false;

  @override
  bool get hiddenLocallyOnDevice => false;

  @override
  // ignore: long-parameter-list
  IStatus copyWith({
    IAccount? account,
    IStatus? reblog,
    int? id,
    String? remoteId,
    DateTime? createdAt,
    IStatus? inReplyToStatus,
    String? inReplyToRemoteId,
    String? inReplyToAccountRemoteId,
    bool? nsfwSensitive,
    String? spoilerText,
    PleromaVisibility? visibility,
    String? uri,
    String? url,
    int? repliesCount,
    int? reblogsCount,
    int? favouritesCount,
    bool? favourited,
    bool? reblogged,
    bool? muted,
    bool? bookmarked,
    bool? pinned,
    String? content,
    String? reblogStatusRemoteId,
    PleromaApplication? application,
    String? accountRemoteId,
    List<PleromaMediaAttachment>? mediaAttachments,
    List<PleromaMention>? mentions,
    List<PleromaTag>? tags,
    List<PleromaEmoji>? emojis,
    PleromaPoll? poll,
    PleromaCard? card,
    String? language,
    PleromaContent? pleromaContent,
    int? pleromaConversationId,
    int? pleromaDirectConversationId,
    String? pleromaInReplyToAccountAcct,
    bool? pleromaLocal,
    PleromaContent? pleromaSpoilerText,
    DateTime? pleromaExpiresAt,
    bool? pleromaThreadMuted,
    List<PleromaStatusEmojiReaction?>? pleromaEmojiReactions,
    bool? deleted,
    PendingState? pendingState,
    String? oldPendingRemoteId,
    bool? hiddenLocallyOnDevice,
    String? wasSentWithIdempotencyKey,
  }) {
    throw UnsupportedError("Not supported for non-published statuses");
  }
}
