// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_mention_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiMention _$PleromaApiMentionFromJson(Map<String, dynamic> json) {
  return PleromaApiMention(
    acct: json['acct'] as String,
    id: PleromaApiMention.fromIdJson(json['id']),
    url: json['url'] as String,
    username: json['username'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiMentionToJson(PleromaApiMention instance) =>
    <String, dynamic>{
      'acct': instance.acct,
      'id': instance.id,
      'url': instance.url,
      'username': instance.username,
    };
