// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_status_poll_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostStatusPoll _$PostStatusPollFromJson(Map<String, dynamic> json) {
  return PostStatusPoll(
    expiresAt: json['expires_at'] == null
        ? null
        : DateTime.parse(json['expires_at'] as String),
    hideTotals: json['hide_totals'] as bool,
    multiple: json['multiple'] as bool,
    options: (json['options'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PostStatusPollToJson(PostStatusPoll instance) =>
    <String, dynamic>{
      'expires_at': instance.expiresAt?.toIso8601String(),
      'hide_totals': instance.hideTotals,
      'multiple': instance.multiple,
      'options': instance.options,
    };
