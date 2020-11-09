import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/pleroma/card/pleroma_card_model.dart';
import 'package:fedi/pleroma/emoji/pleroma_emoji_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';

abstract class IChatMessage {
  int get localId;

  String get remoteId;

  String get chatRemoteId;

  IAccount get account;

  String get content;

  List<IPleromaMediaAttachment> get mediaAttachments;

  DateTime get createdAt;

  List<IPleromaEmoji> get emojis;

  IPleromaCard get card;

  IChatMessage copyWith({
    int localId,
    String remoteId,
    String chatRemoteId,
    IAccount account,
    String content,
    DateTime createdAt,
    List<IPleromaMediaAttachment> mediaAttachments,
    List<PleromaEmoji> emojis,
    IPleromaCard card,
  });
}
