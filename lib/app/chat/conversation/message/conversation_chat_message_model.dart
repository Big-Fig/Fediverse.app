import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';

abstract class IConversationChatMessage extends IChatMessage {
  IStatus get status;

  @override
  IConversationChatMessage copyWith({
    int? localId,
    String? remoteId,
    String? chatRemoteId,
    IAccount? account,
    String? content,
    DateTime? createdAt,
    List<IPleromaApiMediaAttachment>? mediaAttachments,
    List<PleromaApiEmoji>? emojis,
    IPleromaApiCard? card,
    PendingState? pendingState,
    String? oldPendingRemoteId,
    bool? deleted,
    bool? hiddenLocallyOnDevice,
    String? wasSentWithIdempotencyKey,
  });
}

extension IStatusConversationChatMessageExtension on IStatus {
  ConversationChatMessageStatusAdapter
      toConversationChatMessageStatusAdapter() =>
          ConversationChatMessageStatusAdapter(status: this);
}

extension IPleromaStatusConversationChatMessageExtension on IPleromaApiStatus {
  ConversationChatMessageStatusAdapter
      toConversationChatMessageStatusAdapter() =>
          ConversationChatMessageStatusAdapter(
            status: DbStatusPopulatedWrapper(
              dbStatusPopulated: DbStatusPopulated(
                dbStatus: toDbStatus(),
                dbAccount: account.toDbAccount(),
                reblogDbStatus: reblog?.toDbStatus(),
                reblogDbStatusAccount: reblog?.account.toDbAccount(),
                replyDbStatus: null,
                replyDbStatusAccount: null,
                replyReblogDbStatus: null,
                replyReblogDbStatusAccount: null,
              ),
            ),
          );
}

class ConversationChatMessageStatusAdapter extends IConversationChatMessage {
  @override
  final IStatus status;

  ConversationChatMessageStatusAdapter({
    required this.status,
  });

  @override
  int? get localId => status.localId;

  @override
  IAccount get account => status.account;

  @override
  String get chatRemoteId => status.pleromaDirectConversationId!.toString();

  @override
  String? get content => status.content;

  @override
  IPleromaApiCard? get card => status.card;

  @override
  DateTime get createdAt => status.createdAt;

  @override
  List<IPleromaApiEmoji>? get emojis => status.emojis;

  @override
  String get remoteId => status.remoteId!;

  @override
  List<IPleromaApiMediaAttachment>? get mediaAttachments =>
      status.mediaAttachments;

  @override
  PendingState? get pendingState => status.pendingState;

  @override
  String? get oldPendingRemoteId => status.oldPendingRemoteId;

  @override
  // ignore: long-parameter-list
  IConversationChatMessage copyWith({
    int? localId,
    String? remoteId,
    String? chatRemoteId,
    IAccount? account,
    String? content,
    DateTime? createdAt,
    List<IPleromaApiMediaAttachment>? mediaAttachments,
    List<PleromaApiEmoji>? emojis,
    IPleromaApiCard? card,
    PendingState? pendingState,
    String? oldPendingRemoteId,
    bool? deleted,
    bool? hiddenLocallyOnDevice,
    String? wasSentWithIdempotencyKey,
  }) {
    return ConversationChatMessageStatusAdapter(
      status: status.copyWith(
        id: localId,
        remoteId: remoteId,
        pleromaDirectConversationId:
            chatRemoteId != null ? int.tryParse(chatRemoteId) : null,
        account: account,
        content: content,
        createdAt: createdAt,
        mediaAttachments: mediaAttachments?.toPleromaApiMediaAttachments(),
        emojis: emojis,
        card: card?.toPleromaApiCard(),
        pendingState: pendingState,
        oldPendingRemoteId: oldPendingRemoteId,
        deleted: deleted,
        hiddenLocallyOnDevice: hiddenLocallyOnDevice,
        wasSentWithIdempotencyKey: wasSentWithIdempotencyKey,
      ),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationChatMessageStatusAdapter &&
          runtimeType == other.runtimeType &&
          status == other.status;

  @override
  int get hashCode => status.hashCode;

  @override
  bool get deleted => status.deleted;

  @override
  bool get hiddenLocallyOnDevice => status.hiddenLocallyOnDevice;

  @override
  String? get wasSentWithIdempotencyKey => status.wasSentWithIdempotencyKey;

  @override
  String get accountRemoteId => status.account.remoteId;
}
