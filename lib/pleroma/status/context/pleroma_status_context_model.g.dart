// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_status_context_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaStatusContext _$PleromaStatusContextFromJson(Map<String, dynamic> json) {
  return PleromaStatusContext(
    descendants: (json['descendants'] as List)
        ?.map((e) => e == null
            ? null
            : PleromaStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ancestors: (json['ancestors'] as List)
        ?.map((e) => e == null
            ? null
            : PleromaStatus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PleromaStatusContextToJson(
        PleromaStatusContext instance) =>
    <String, dynamic>{
      'descendants': instance.descendants,
      'ancestors': instance.ancestors,
    };
