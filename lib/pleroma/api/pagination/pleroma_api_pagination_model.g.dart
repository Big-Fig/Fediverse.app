// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiPaginationRequest _$PleromaApiPaginationRequestFromJson(
    Map<String, dynamic> json) {
  return PleromaApiPaginationRequest(
    limit: json['limit'] as int?,
    maxId: json['max_id'] as String?,
    minId: json['min_id'] as String?,
    sinceId: json['since_id'] as String?,
  );
}

Map<String, dynamic> _$PleromaApiPaginationRequestToJson(
        PleromaApiPaginationRequest instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'max_id': instance.maxId,
      'min_id': instance.minId,
      'since_id': instance.sinceId,
    };
