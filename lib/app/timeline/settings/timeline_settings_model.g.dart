// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineSettingsAdapter extends TypeAdapter<TimelineSettings> {
  @override
  TimelineSettings read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelineSettings(
      id: fields[12] as String,
      onlyWithMedia: fields[1] as bool,
      onlyNoReplies: fields[2] as bool,
      onlyNoNsfwSensitive: fields[3] as bool,
      onlyRemote: fields[4] as bool,
      onlyLocal: fields[5] as bool,
      withMuted: fields[6] as bool,
      excludeVisibilitiesStrings: (fields[7] as List)?.cast<String>(),
      remoteTypeString: fields[8] as String,
      onlyInListWithRemoteId: fields[9] as String,
      withHashtag: fields[10] as String,
      timelineReplyVisibilityFilterString: fields[11] as String,
      onlyFromAccountWithRemoteId: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TimelineSettings obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.onlyWithMedia)
      ..writeByte(2)
      ..write(obj.onlyNoReplies)
      ..writeByte(3)
      ..write(obj.onlyNoNsfwSensitive)
      ..writeByte(4)
      ..write(obj.onlyRemote)
      ..writeByte(5)
      ..write(obj.onlyLocal)
      ..writeByte(6)
      ..write(obj.withMuted)
      ..writeByte(7)
      ..write(obj.excludeVisibilitiesStrings)
      ..writeByte(8)
      ..write(obj.remoteTypeString)
      ..writeByte(9)
      ..write(obj.onlyInListWithRemoteId)
      ..writeByte(10)
      ..write(obj.withHashtag)
      ..writeByte(11)
      ..write(obj.timelineReplyVisibilityFilterString)
      ..writeByte(12)
      ..write(obj.id)
      ..writeByte(13)
      ..write(obj.onlyFromAccountWithRemoteId);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelineSettings _$TimelineSettingsFromJson(Map<String, dynamic> json) {
  return TimelineSettings(
    id: json['id'] as String,
    onlyWithMedia: json['only_with_media'] as bool,
    onlyNoReplies: json['only_no_replies'] as bool,
    onlyNoNsfwSensitive: json['only_no_nsfw_sensitive'] as bool,
    onlyRemote: json['only_remote'] as bool,
    onlyLocal: json['only_local'] as bool,
    withMuted: json['with_muted'] as bool,
    excludeVisibilitiesStrings: (json['exclude_visibilities'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    remoteTypeString: json['remote_type'] as String,
    onlyInListWithRemoteId: json['only_in_list_with_remote_id'] as String,
    withHashtag: json['with_hashtag'] as String,
    timelineReplyVisibilityFilterString:
        json['timeline_reply_visibility_filter'] as String,
    onlyFromAccountWithRemoteId:
        json['only_from_account_with_remote_id'] as String,
  );
}

Map<String, dynamic> _$TimelineSettingsToJson(TimelineSettings instance) =>
    <String, dynamic>{
      'only_with_media': instance.onlyWithMedia,
      'only_no_replies': instance.onlyNoReplies,
      'only_no_nsfw_sensitive': instance.onlyNoNsfwSensitive,
      'only_remote': instance.onlyRemote,
      'only_local': instance.onlyLocal,
      'with_muted': instance.withMuted,
      'exclude_visibilities': instance.excludeVisibilitiesStrings,
      'remote_type': instance.remoteTypeString,
      'only_in_list_with_remote_id': instance.onlyInListWithRemoteId,
      'with_hashtag': instance.withHashtag,
      'timeline_reply_visibility_filter':
          instance.timelineReplyVisibilityFilterString,
      'id': instance.id,
      'only_from_account_with_remote_id': instance.onlyFromAccountWithRemoteId,
    };
