// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_status_context_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiStatusContext _$PleromaApiStatusContextFromJson(
    Map<String, dynamic> json) {
  return PleromaApiStatusContext(
    descendants: (json['descendants'] as List<dynamic>)
        .map((e) => PleromaApiStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
    ancestors: (json['ancestors'] as List<dynamic>)
        .map((e) => PleromaApiStatus.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PleromaApiStatusContextToJson(
        PleromaApiStatusContext instance) =>
    <String, dynamic>{
      'descendants': instance.descendants.map((e) => e.toJson()).toList(),
      'ancestors': instance.ancestors.map((e) => e.toJson()).toList(),
    };
