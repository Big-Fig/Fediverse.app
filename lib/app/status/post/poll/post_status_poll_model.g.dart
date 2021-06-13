// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_status_poll_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostStatusPoll _$PostStatusPollFromJson(Map<String, dynamic> json) {
  return PostStatusPoll(
    durationLength: json['duration_length'] == null
        ? null
        : Duration(microseconds: json['duration_length'] as int),
    hideTotals: json['hide_totals'] as bool,
    multiple: json['multiple'] as bool,
    options:
        (json['options'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$PostStatusPollToJson(PostStatusPoll instance) =>
    <String, dynamic>{
      'duration_length': instance.durationLength?.inMicroseconds,
      'hide_totals': instance.hideTotals,
      'multiple': instance.multiple,
      'options': instance.options,
    };
