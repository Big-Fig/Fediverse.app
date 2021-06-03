// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiChat _$PleromaApiChatFromJson(Map<String, dynamic> json) {
  return PleromaApiChat(
    id: json['id'] as String,
    unread: json['unread'] as int,
    account:
        PleromaApiAccount.fromJson(json['account'] as Map<String, dynamic>),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    lastMessage: json['last_message'] == null
        ? null
        : PleromaApiChatMessage.fromJson(
            json['last_message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiChatToJson(PleromaApiChat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unread': instance.unread,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'account': instance.account.toJson(),
      'last_message': instance.lastMessage?.toJson(),
    };

PleromaApiChatMessage _$PleromaApiChatMessageFromJson(
    Map<String, dynamic> json) {
  return PleromaApiChatMessage(
    id: json['id'] as String,
    chatId: json['chat_id'] as String,
    accountId: json['account_id'] as String,
    content: json['content'] as String?,
    createdAt: DateTime.parse(json['created_at'] as String),
    emojis: (json['emojis'] as List<dynamic>?)
        ?.map((e) => PleromaApiEmoji.fromJson(e as Map<String, dynamic>))
        .toList(),
    mediaAttachment: json['attachment'] == null
        ? null
        : PleromaApiMediaAttachment.fromJson(
            json['attachment'] as Map<String, dynamic>),
    card: json['card'] == null
        ? null
        : PleromaApiCard.fromJson(json['card'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiChatMessageToJson(
        PleromaApiChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'account_id': instance.accountId,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'emojis': instance.emojis?.map((e) => e.toJson()).toList(),
      'attachment': instance.mediaAttachment?.toJson(),
      'card': instance.card?.toJson(),
    };

PleromaApiChatMessageSendData _$PleromaApiChatMessageSendDataFromJson(
    Map<String, dynamic> json) {
  return PleromaApiChatMessageSendData(
    content: json['content'] as String?,
    mediaId: json['media_id'] as String?,
    idempotencyKey: json['idempotency_key'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiChatMessageSendDataToJson(
        PleromaApiChatMessageSendData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'media_id': instance.mediaId,
      'idempotency_key': instance.idempotencyKey,
    };
