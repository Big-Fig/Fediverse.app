import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../card/pleroma_api_card_model_impl.dart';
import '../../emoji/pleroma_api_emoji_model_impl.dart';
import '../../media/attachment/pleroma_api_media_attachment_model_impl.dart';
import 'pleroma_api_chat_message_model.dart';

part 'pleroma_api_chat_message_model_impl.freezed.dart';

part 'pleroma_api_chat_message_model_impl.g.dart';

// ignore_for_file: no-magic-number
@HiveType(typeId: 0)
@freezed
class PleromaApiChatMessage
    with _$PleromaApiChatMessage
    implements IPleromaApiChatMessage {
  const factory PleromaApiChatMessage({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: 'chat_id') required String chatId,
    @HiveField(2) @JsonKey(name: 'account_id') required String accountId,
    @HiveField(3) required String? content,
    @HiveField(4) @JsonKey(name: 'created_at') required DateTime createdAt,
    @HiveField(5) required List<PleromaApiEmoji>? emojis,
    @HiveField(6)
    @JsonKey(name: 'attachment')
        required PleromaApiMediaAttachment? mediaAttachment,
    @HiveField(7) required PleromaApiCard? card,
  }) = _PleromaApiChatMessage;

  factory PleromaApiChatMessage.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiChatMessageFromJson(json);
}

extension IPleromaApiChatMessageInterfaceExtension on IPleromaApiChatMessage {
  PleromaApiChatMessage toPleromaApiChatMessage({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiChatMessage(
          id: id,
          chatId: chatId,
          accountId: accountId,
          content: content,
          createdAt: createdAt,
          emojis: emojis?.toPleromaApiEmojiList(
            forceNewObject: forceNewObject,
          ),
          mediaAttachment: mediaAttachment?.toPleromaApiMediaAttachment(
            forceNewObject: forceNewObject,
          ),
          card: card?.toPleromaApiCard(forceNewObject: forceNewObject),
        ),
        forceNewObject: forceNewObject,
      );
}
