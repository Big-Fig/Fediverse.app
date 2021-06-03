import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/status_model.dart';
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

class ChatSelectionShareActionStatusAdapter implements IStatus {
  @override
  final String? content;
  @override
  final IAccount account;
  @override
  final PleromaApiVisibility visibility;
  @override
  final List<PleromaApiMediaAttachment>? mediaAttachments;

  ChatSelectionShareActionStatusAdapter({
    required this.content,
    required this.account,
    required this.visibility,
    required this.mediaAttachments,
  });

  @override
  String toString() {
    return 'ChatSelectionShareActionStatusAdapter{'
        'content: $content, '
        'account: $account, '
        'mediaAttachments: $mediaAttachments, '
        'visibility: $visibility'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatSelectionShareActionStatusAdapter &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          account == other.account &&
          mediaAttachments == other.mediaAttachments &&
          visibility == other.visibility;

  @override
  int get hashCode => content.hashCode ^ account.hashCode ^ visibility.hashCode;

  @override
  PleromaApiApplication? get application => throw UnimplementedError();

  @override
  bool get bookmarked => throw UnimplementedError();

  @override
  PleromaApiCard? get card => throw UnimplementedError();

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
    PleromaApiVisibility? visibility,
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
    PleromaApiApplication? application,
    String? accountRemoteId,
    List<PleromaApiMediaAttachment>? mediaAttachments,
    List<PleromaApiMention>? mentions,
    List<PleromaApiTag>? tags,
    List<PleromaApiEmoji>? emojis,
    PleromaApiPoll? poll,
    PleromaApiCard? card,
    String? language,
    PleromaApiContent? pleromaContent,
    int? pleromaConversationId,
    int? pleromaDirectConversationId,
    String? pleromaInReplyToAccountAcct,
    bool? pleromaLocal,
    PleromaApiContent? pleromaSpoilerText,
    DateTime? pleromaExpiresAt,
    bool? pleromaThreadMuted,
    List<PleromaApiStatusEmojiReaction?>? pleromaEmojiReactions,
    bool? deleted,
    PendingState? pendingState,
    String? oldPendingRemoteId,
    bool? hiddenLocallyOnDevice,
    String? wasSentWithIdempotencyKey,
  }) {
    throw UnimplementedError();
  }

  @override
  DateTime get createdAt => throw UnimplementedError();

  @override
  bool get deleted => throw UnimplementedError();

  @override
  List<PleromaApiEmoji>? get emojis => throw UnimplementedError();

  @override
  bool get favourited => throw UnimplementedError();

  @override
  int get favouritesCount => throw UnimplementedError();

  @override
  bool get hiddenLocallyOnDevice => throw UnimplementedError();

  @override
  String? get inReplyToAccountRemoteId => throw UnimplementedError();

  @override
  String? get inReplyToRemoteId => throw UnimplementedError();

  @override
  IStatus? get inReplyToStatus => throw UnimplementedError();

  @override
  bool get isHaveReblog => throw UnimplementedError();

  @override
  bool get isReply => throw UnimplementedError();

  @override
  String? get language => throw UnimplementedError();

  @override
  int? get localId => throw UnimplementedError();

  @override
  List<PleromaApiMention>? get mentions => throw UnimplementedError();

  @override
  bool get muted => throw UnimplementedError();

  @override
  bool get nsfwSensitive => throw UnimplementedError();

  @override
  String? get oldPendingRemoteId => throw UnimplementedError();

  @override
  PendingState? get pendingState => throw UnimplementedError();

  @override
  bool get pinned => throw UnimplementedError();

  @override
  PleromaApiContent? get pleromaContent => throw UnimplementedError();

  @override
  int? get pleromaConversationId => throw UnimplementedError();

  @override
  int? get pleromaDirectConversationId => throw UnimplementedError();

  @override
  List<PleromaApiStatusEmojiReaction>? get pleromaEmojiReactions =>
      throw UnimplementedError();

  @override
  DateTime? get pleromaExpiresAt => throw UnimplementedError();

  @override
  String? get pleromaInReplyToAccountAcct => throw UnimplementedError();

  @override
  bool? get pleromaLocal => throw UnimplementedError();

  @override
  PleromaApiContent? get pleromaSpoilerText => throw UnimplementedError();

  @override
  bool? get pleromaThreadMuted => throw UnimplementedError();

  @override
  PleromaApiPoll? get poll => throw UnimplementedError();

  @override
  IStatus? get reblog => throw UnimplementedError();

  @override
  String? get reblogStatusRemoteId => throw UnimplementedError();

  @override
  bool get reblogged => throw UnimplementedError();

  @override
  int get reblogsCount => throw UnimplementedError();

  @override
  String get remoteId => throw UnimplementedError();

  @override
  int get repliesCount => throw UnimplementedError();

  @override
  String? get spoilerText => throw UnimplementedError();

  @override
  List<PleromaApiTag>? get tags => throw UnimplementedError();

  @override
  String get uri => throw UnimplementedError();

  @override
  String get url => throw UnimplementedError();

  @override
  String? get wasSentWithIdempotencyKey => throw UnimplementedError();

  @override
  int compareTo(IStatus b) => IStatus.compareItemsToSort(this, b);

  @override
  bool isEqualTo(IStatus b) => IStatus.isItemsEqual(this, b);
}
