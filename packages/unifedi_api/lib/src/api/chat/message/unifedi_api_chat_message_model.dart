import '../../card/unifedi_api_card_model.dart';
import '../../emoji/unifedi_api_emoji_model.dart';
import '../../media/attachment/unifedi_api_media_attachment_model.dart';
import '../../unifedi_api_model.dart';

abstract class IUnifediApiChatMessage implements IUnifediApiResponse {
  String get id;

  String get chatId;

  String get accountId;

  String? get content;

  DateTime get createdAt;

  List<IUnifediApiEmoji>? get emojis;

  IUnifediApiMediaAttachment? get mediaAttachment;

  IUnifediApiCard? get card;
}
