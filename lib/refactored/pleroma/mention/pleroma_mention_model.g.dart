// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_mention_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaMention _$PleromaMentionFromJson(Map<String, dynamic> json) {
  return PleromaMention(
    acct: json['acct'] as String,
    id: json['id'] as String,
    url: json['url'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$PleromaMentionToJson(PleromaMention instance) =>
    <String, dynamic>{
      'acct': instance.acct,
      'id': instance.id,
      'url': instance.url,
      'username': instance.username,
    };
