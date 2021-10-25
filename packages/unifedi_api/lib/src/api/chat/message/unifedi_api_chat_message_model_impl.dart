import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../card/unifedi_api_card_model_impl.dart';
import '../../emoji/unifedi_api_emoji_model_impl.dart';
import '../../media/attachment/unifedi_api_media_attachment_model_impl.dart';
import 'unifedi_api_chat_message_model.dart';

part 'unifedi_api_chat_message_model_impl.freezed.dart';

part 'unifedi_api_chat_message_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class UnifediApiChatMessage
    with _$UnifediApiChatMessage
    implements IUnifediApiChatMessage {
  const factory UnifediApiChatMessage({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: 'chat_id') required String chatId,
    @HiveField(2) @JsonKey(name: 'account_id') required String accountId,
    @HiveField(3) required String? content,
    @HiveField(4) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(5) required List<UnifediApiEmoji>? emojis,
    @HiveField(6)
    @JsonKey(name: 'attachment')
        required UnifediApiMediaAttachment? mediaAttachment,
    @HiveField(7) required UnifediApiCard? card,
  }) = _UnifediApiChatMessage;

  factory UnifediApiChatMessage.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiChatMessageFromJson(json);
}

extension IUnifediApiChatMessageInterfaceExtension on IUnifediApiChatMessage {
  UnifediApiChatMessage toUnifediApiChatMessage({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiChatMessage(
          id: id,
          chatId: chatId,
          accountId: accountId,
          content: content,
          createdAt: createdAt,
          emojis: emojis?.toUnifediApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          mediaAttachment: mediaAttachment?.toUnifediApiMediaAttachment(
            forceNewObject: forceNewObject,
          ),
          card: card?.toUnifediApiCard(forceNewObject: forceNewObject),
        ),
        forceNewObject: forceNewObject,
      );
}
