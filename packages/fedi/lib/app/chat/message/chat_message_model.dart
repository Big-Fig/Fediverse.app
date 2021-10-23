import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IChatMessage {
  int? get localId;

  String get remoteId;

  String get chatRemoteId;

  IAccount? get account;

  String get accountRemoteId;

  String? get content;

  List<IUnifediApiMediaAttachment>? get mediaAttachments;

  DateTime get createdAt;

  List<IUnifediApiEmoji>? get emojis;

  IUnifediApiCard? get card;

  PendingState? get pendingState;

  String? get oldPendingRemoteId;

  bool get deleted;

  bool get hiddenLocallyOnDevice;

  String? get wasSentWithIdempotencyKey;
}

extension IChatMessageExtension on IChatMessage {
  bool get isPendingStatePublishedOrNull =>
      pendingState == null || pendingState == PendingState.published;

  bool get isPublishedAndNotDeletedAndNotLocallyHidden =>
      !deleted && !hiddenLocallyOnDevice && isPendingStatePublishedOrNull;

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
