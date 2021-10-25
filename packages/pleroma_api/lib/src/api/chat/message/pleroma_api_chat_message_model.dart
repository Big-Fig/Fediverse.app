import '../../card/pleroma_api_card_model.dart';
import '../../emoji/pleroma_api_emoji_model.dart';
import '../../media/attachment/pleroma_api_media_attachment_model.dart';
import '../../pleroma_api_model.dart';

abstract class IPleromaApiChatMessage implements IPleromaApiResponse {
  String get id;

  String get chatId;

  String get accountId;

  String? get content;

  DateTime get createdAt;

  List<IPleromaApiEmoji>? get emojis;

  IPleromaApiMediaAttachment? get mediaAttachment;

  IPleromaApiCard? get card;
}
