// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaChat _$PleromaChatFromJson(Map<String, dynamic> json) {
  return PleromaChat(
    id: json['id'] as String,
    unread: json['unread'] as int,
    account: json['account'] == null
        ? null
        : PleromaAccount.fromJson(json['account'] as Map<String, dynamic>),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$PleromaChatToJson(PleromaChat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unread': instance.unread,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'account': instance.account,
    };

PleromaChatMessage _$PleromaChatMessageFromJson(Map<String, dynamic> json) {
  return PleromaChatMessage(
    id: json['id'] as String,
    chatId: json['chat_id'] as String,
    accountId: json['account_id'] as String,
    content: json['content'] as String,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    emojis: (json['emojis'] as List)
        ?.map((e) =>
            e == null ? null : PleromaEmoji.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    mediaAttachment: json['attachment'] == null
        ? null
        : PleromaMediaAttachment.fromJson(
            json['attachment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaChatMessageToJson(PleromaChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'account_id': instance.accountId,
      'content': instance.content,
      'created_at': instance.createdAt?.toIso8601String(),
      'emojis': instance.emojis,
      'attachment': instance.mediaAttachment,
    };

PleromaChatMessageSendData _$PleromaChatMessageSendDataFromJson(
    Map<String, dynamic> json) {
  return PleromaChatMessageSendData(
    content: json['content'] as String,
    mediaId: json['media_id'] as String,
  );
}

Map<String, dynamic> _$PleromaChatMessageSendDataToJson(
        PleromaChatMessageSendData instance) =>
    <String, dynamic>{
      'content': instance.content,
      'media_id': instance.mediaId,
    };
