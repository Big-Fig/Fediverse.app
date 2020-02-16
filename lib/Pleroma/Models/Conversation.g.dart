// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return Conversation(
    unread: json['unread'] as bool,
    lastStatus: json['last_status'] == null
        ? null
        : PleromaStatus.fromJson(json['last_status'] as Map<String, dynamic>),
    id: json['id'] as String,
    accounts: (json['accounts'] as List)
        ?.map((e) => e == null
            ? null
            : PleromaAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'unread': instance.unread,
      'last_status': instance.lastStatus,
      'id': instance.id,
      'accounts': instance.accounts,
    };
