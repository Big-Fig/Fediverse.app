import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';

abstract class IChatMessage {
  int? get localId;

  String get remoteId;

  String get chatRemoteId;

  IAccount get account;

  String? get content;

  List<IPleromaMediaAttachment>? get mediaAttachments;

  DateTime get createdAt;

  List<IPleromaEmoji>? get emojis;

  IPleromaCard? get card;

  PendingState? get pendingState;

  String? get oldPendingRemoteId;

  bool get deleted;

  bool get hiddenLocallyOnDevice;

  String? get wasSentWithIdempotencyKey;

  IChatMessage copyWith({
    int? localId,
    String? remoteId,
    String? chatRemoteId,
    IAccount? account,
    String? content,
    DateTime? createdAt,
    List<IPleromaMediaAttachment>? mediaAttachments,
    List<PleromaEmoji>? emojis,
    IPleromaCard? card,
    PendingState? pendingState,
    String? oldPendingRemoteId,
    bool? deleted,
    bool? hiddenLocallyOnDevice,
    String? wasSentWithIdempotencyKey,
  });
}

extension IChatMessageExtension on IChatMessage {
  bool get isPendingStatePublishedOrNull =>
      pendingState == null || pendingState == PendingState.published;

  bool get isPublishedAndNotDeletedAndNotLocallyHidden =>
      deleted != true &&
      hiddenLocallyOnDevice != true &&
      isPendingStatePublishedOrNull;

  bool get isPendingStateNotPublishedOrNull => !isPendingStatePublishedOrNull;

  bool get isNotPending => pendingState != PendingState.pending;

  bool get isPending => pendingState == PendingState.pending;

  bool get isPendingFailed => pendingState == PendingState.fail;

  bool get isPendingFailedOrPending => isPending || isPendingFailed;

  EmojiText? toContentEmojiText() {
    if (content?.isNotEmpty == true) {
      return EmojiText(
        text: content!,
        emojis: emojis,
      );
    } else {
      return null;
    }
  }
}
