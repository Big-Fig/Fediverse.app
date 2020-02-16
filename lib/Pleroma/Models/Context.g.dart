// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Context _$ContextFromJson(Map<String, dynamic> json) {
  return Context(
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

Map<String, dynamic> _$ContextToJson(Context instance) => <String, dynamic>{
      'descendants': instance.descendants,
      'ancestors': instance.ancestors,
    };
