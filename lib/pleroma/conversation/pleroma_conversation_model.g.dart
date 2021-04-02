// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaConversationPleromaPart _$PleromaConversationPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaConversationPleromaPart(
    recipients: (json['recipients'] as List<dynamic>?)
        ?.map((e) => PleromaAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PleromaConversationPleromaPartToJson(
        PleromaConversationPleromaPart instance) =>
    <String, dynamic>{
      'recipients': instance.recipients,
    };

PleromaConversation _$PleromaConversationFromJson(Map<String, dynamic> json) {
  return PleromaConversation(
    unread: json['unread'] as bool?,
    lastStatus: json['last_status'] == null
        ? null
        : PleromaStatus.fromJson(json['last_status'] as Map<String, dynamic>),
    id: json['id'] as String?,
    accounts: (json['accounts'] as List<dynamic>?)
        ?.map((e) => PleromaAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
    pleroma: json['pleroma'] == null
        ? null
        : PleromaConversationPleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaConversationToJson(
        PleromaConversation instance) =>
    <String, dynamic>{
      'unread': instance.unread,
      'last_status': instance.lastStatus,
      'id': instance.id,
      'accounts': instance.accounts,
      'pleroma': instance.pleroma,
    };
