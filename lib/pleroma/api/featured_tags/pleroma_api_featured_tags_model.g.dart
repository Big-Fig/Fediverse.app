// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_featured_tags_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiFeaturedTag _$PleromaApiFeaturedTagFromJson(
    Map<String, dynamic> json) {
  return PleromaApiFeaturedTag(
    id: json['id'] as String,
    lastStatusAt: json['last_status_at'] == null
        ? null
        : DateTime.parse(json['last_status_at'] as String),
    statusesCount: json['statuses_count'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$PleromaApiFeaturedTagToJson(
        PleromaApiFeaturedTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last_status_at': instance.lastStatusAt?.toIso8601String(),
      'statuses_count': instance.statusesCount,
      'name': instance.name,
    };
