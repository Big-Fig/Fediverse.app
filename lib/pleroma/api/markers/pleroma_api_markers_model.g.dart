// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_markers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiMarker _$PleromaApiMarkerFromJson(Map<String, dynamic> json) {
  return PleromaApiMarker(
    lastReadId: json['updated_last_read_id'] as String?,
    version: json['version'] as int,
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    pleroma: json['pleroma'] == null
        ? null
        : PleromaApiMarkerPleromaPart.fromJson(
            json['pleroma'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PleromaApiMarkerToJson(PleromaApiMarker instance) =>
    <String, dynamic>{
      'updated_last_read_id': instance.lastReadId,
      'version': instance.version,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'pleroma': instance.pleroma?.toJson(),
    };

PleromaApiMarkerPleromaPart _$PleromaApiMarkerPleromaPartFromJson(
    Map<String, dynamic> json) {
  return PleromaApiMarkerPleromaPart(
    unreadCount: json['unread_count'] as int?,
  );
}

Map<String, dynamic> _$PleromaApiMarkerPleromaPartToJson(
        PleromaApiMarkerPleromaPart instance) =>
    <String, dynamic>{
      'unread_count': instance.unreadCount,
    };
