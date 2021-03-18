import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/pending/pending_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatMessageBloc implements IDisposable {
  static IChatMessageBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatMessageBloc>(context, listen: listen);

  IChatMessage get chatMessage;

  Stream<IChatMessage> get chatMessageStream;

  String? get content;

  Stream<String?> get contentStream;

  List<IPleromaMediaAttachment>? get mediaAttachments;

  Stream<List<IPleromaMediaAttachment>?> get mediaAttachmentsStream;

  IPleromaCard? get card;

  Stream<IPleromaCard?> get cardStream;

  EmojiText? get contentWithEmojis;

  Stream<EmojiText?> get contentWithEmojisStream;

  IAccount get account;

  Stream<IAccount> get accountStream;

  DateTime get createdAt;

  Stream<DateTime> get createdAtStream;

  String get remoteId;

  String get accountAvatar;

  Stream<String> get accountAvatarStream;

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

  List<IPleromaEmoji>? get emojis;

  Future refreshFromNetwork();

  Future delete();

  Future resendPendingFailed();
}