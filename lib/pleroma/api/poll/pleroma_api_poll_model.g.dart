// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_poll_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaPollOption _$PleromaPollOptionFromJson(Map<String, dynamic> json) {
  return PleromaPollOption(
    title: json['title'] as String,
    votesCount: json['votes_count'] as int,
  );
}

Map<String, dynamic> _$PleromaPollOptionToJson(PleromaPollOption instance) =>
    <String, dynamic>{
      'title': instance.title,
      'votes_count': instance.votesCount,
    };

PleromaPoll _$PleromaPollFromJson(Map<String, dynamic> json) {
  return PleromaPoll(
    expired: json['expired'] as bool,
    expiresAt: DateTime.parse(json['expires_at'] as String),
    id: json['id'] as String?,
    multiple: json['multiple'] as bool,
    options: (json['options'] as List<dynamic>)
        .map((e) => PleromaPollOption.fromJson(e as Map<String, dynamic>))
        .toList(),
    ownVotes:
        (json['own_votes'] as List<dynamic>).map((e) => e as int).toList(),
    voted: json['voted'] as bool,
    votersCount: json['voters_count'] as int,
    votesCount: json['votes_count'] as int,
  );
}

Map<String, dynamic> _$PleromaPollToJson(PleromaPoll instance) =>
    <String, dynamic>{
      'expired': instance.expired,
      'expires_at': instance.expiresAt.toIso8601String(),
      'id': instance.id,
      'multiple': instance.multiple,
      'options': instance.options,
      'own_votes': instance.ownVotes,
      'voted': instance.voted,
      'voters_count': instance.votersCount,
      'votes_count': instance.votesCount,
    };
