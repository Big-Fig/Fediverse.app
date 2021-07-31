// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiConversationPleromaPart _$PleromaApiConversationPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaApiConversationPleromaPart(
    recipients: (json['recipients'] as List<dynamic>?)
        ?.map((e) => PleromaApiAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PleromaApiConversationPleromaPartToJson(
        PleromaApiConversationPleromaPart instance) =>
    <String, dynamic>{
      'recipients': instance.recipients?.map((e) => e.toJson()).toList(),
    };

PleromaApiConversation _$PleromaApiConversationFromJson(
    Map<String, dynamic> json) {
  return PleromaApiConversation(
    unread: json['unread'] as bool?,
    lastStatus: json['last_status'] == null
        ? null
        : PleromaApiStatus.fromJson(
            json['last_status'] as Map<String, dynamic>),
    id: json['id'] as String,
    accounts: (json['accounts'] as List<dynamic>?)
        ?.map((e) => PleromaApiAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
    pleroma: json['pleroma'] == null
        ? null
        : PleromaApiConversationPleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiConversationToJson(
        PleromaApiConversation instance) =>
    <String, dynamic>{
      'unread': instance.unread,
      'last_status': instance.lastStatus?.toJson(),
      'id': instance.id,
      'accounts': instance.accounts.map((e) => e.toJson()).toList(),
      'pleroma': instance.pleroma?.toJson(),
    };
