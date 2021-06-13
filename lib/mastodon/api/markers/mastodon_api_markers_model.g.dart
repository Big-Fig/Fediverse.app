// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_markers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonApiMarker _$MastodonApiMarkerFromJson(Map<String, dynamic> json) {
  return MastodonApiMarker(
    lastReadId: json['updated_last_read_id'] as String?,
    version: json['version'] as int,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$MastodonApiMarkerToJson(MastodonApiMarker instance) =>
    <String, dynamic>{
      'updated_last_read_id': instance.lastReadId,
      'version': instance.version,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
