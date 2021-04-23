import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/card/pleroma_api_card_model.dart';
import 'package:fedi/pleroma/api/emoji/pleroma_api_emoji_model.dart';
import 'package:fedi/pleroma/api/media/attachment/pleroma_api_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatMessageBloc implements IDisposable {
  static IChatMessageBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatMessageBloc>(context, listen: listen);

  IChatMessage get chatMessage;

  Stream<IChatMessage> get chatMessageStream;

  String? get content;

  Stream<String?> get contentStream;

  List<IPleromaApiMediaAttachment>? get mediaAttachments;

  Stream<List<IPleromaApiMediaAttachment>?> get mediaAttachmentsStream;

  IPleromaApiCard? get card;

  Stream<IPleromaApiCard?> get cardStream;

  EmojiText? get contentWithEmojis;

  Stream<EmojiText?> get contentWithEmojisStream;

  IAccount? get account;

  Stream<IAccount?> get accountStream;

  String get accountRemoteId;

  Stream<String> get accountRemoteIdStream;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;

  String get remoteId;

  String? get accountAvatar;

  Stream<String?> get accountAvatarStream;

  PendingState? get pendingState;

  Stream<PendingState?> get pendingStateStream;

  bool get isDeleted;

  Stream<bool> get isDeletedStream;

  bool get isHiddenLocallyOnDevice;

  Stream<bool> get isHiddenLocallyOnDeviceStream;

  bool get isPublishedAndNotDeletedAndNotLocallyHidden;

  Stream<bool> get isPublishedAndNotDeletedAndNotLocallyHiddenStream;

  bool get isNotPending;

  Stream<bool> get isNotPendingStream;

  bool get isPending;

  Stream<bool> get isPendingStream;

  bool get isPendingFailed;

  Stream<bool> get isPendingFailedStream;

  List<IPleromaApiEmoji>? get emojis;

  Future refreshFromNetwork();

  Future delete();

  Future resendPendingFailed();
}
