import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pleroma/application/pleroma_application_model.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/content/pleroma_content_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/mention/pleroma_mention_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/tag/pleroma_tag_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';

class ChatSelectionShareActionStatusAdapter implements IStatus {
  @override
  final String? content;
  @override
  final IAccount account;
  @override
  final PleromaVisibility visibility;

  ChatSelectionShareActionStatusAdapter({
    required this.content,
    required this.account,
    required this.visibility,
  });

  @override
  String toString() {
    return 'ChatSelectionShareActionStatusAdapter{'
        'content: $content, '
        'account: $account, '
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
          visibility == other.visibility;

  @override
  int get hashCode => content.hashCode ^ account.hashCode ^ visibility.hashCode;

  @override
  PleromaApplication? get application => throw UnimplementedError();

  @override
  bool get bookmarked => throw UnimplementedError();

  @override
  PleromaCard? get card => throw UnimplementedError();

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
    throw UnimplementedError();
  }

  @override
  DateTime get createdAt => throw UnimplementedError();

  @override
  bool get deleted => throw UnimplementedError();

  @override
  List<PleromaEmoji>? get emojis => throw UnimplementedError();

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
  List<PleromaMediaAttachment>? get mediaAttachments =>
      throw UnimplementedError();

  @override
  List<PleromaMention>? get mentions => throw UnimplementedError();

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
  PleromaContent? get pleromaContent => throw UnimplementedError();

  @override
  int? get pleromaConversationId => throw UnimplementedError();

  @override
  int? get pleromaDirectConversationId => throw UnimplementedError();

  @override
  List<PleromaStatusEmojiReaction>? get pleromaEmojiReactions =>
      throw UnimplementedError();

  @override
  DateTime? get pleromaExpiresAt => throw UnimplementedError();

  @override
  String? get pleromaInReplyToAccountAcct => throw UnimplementedError();

  @override
  bool? get pleromaLocal => throw UnimplementedError();

  @override
  PleromaContent? get pleromaSpoilerText => throw UnimplementedError();

  @override
  bool? get pleromaThreadMuted => throw UnimplementedError();

  @override
  PleromaPoll? get poll => throw UnimplementedError();

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
  List<PleromaTag>? get tags => throw UnimplementedError();

  @override
  String get uri => throw UnimplementedError();

  @override
  String get url => throw UnimplementedError();

  @override
  String? get wasSentWithIdempotencyKey => throw UnimplementedError();
}
