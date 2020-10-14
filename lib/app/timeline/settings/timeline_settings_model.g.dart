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
      onlyWithMedia: fields[1] as bool,
      excludeReplies: fields[2] as bool,
      excludeNsfwSensitive: fields[3] as bool,
      onlyRemote: fields[4] as bool,
      onlyLocal: fields[5] as bool,
      withMuted: fields[6] as bool,
      excludeVisibilitiesStrings: (fields[7] as List)?.cast<String>(),
      onlyInRemoteList: fields[9] as PleromaList,
      withRemoteHashtag: fields[10] as String,
      replyVisibilityFilterString: fields[11] as String,
      onlyFromRemoteAccount: fields[13] as PleromaAccount,
      onlyPinned: fields[14] as bool,
      excludeReblogs: fields[15] as bool,
      webSocketsUpdates: fields[16] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TimelineSettings obj) {
    writer
      ..writeByte(14)
      ..writeByte(1)
      ..write(obj.onlyWithMedia)
      ..writeByte(2)
      ..write(obj.excludeReplies)
      ..writeByte(3)
      ..write(obj.excludeNsfwSensitive)
      ..writeByte(4)
      ..write(obj.onlyRemote)
      ..writeByte(5)
      ..write(obj.onlyLocal)
      ..writeByte(6)
      ..write(obj.withMuted)
      ..writeByte(7)
      ..write(obj.excludeVisibilitiesStrings)
      ..writeByte(9)
      ..write(obj.onlyInRemoteList)
      ..writeByte(10)
      ..write(obj.withRemoteHashtag)
      ..writeByte(11)
      ..write(obj.replyVisibilityFilterString)
      ..writeByte(13)
      ..write(obj.onlyFromRemoteAccount)
      ..writeByte(14)
      ..write(obj.onlyPinned)
      ..writeByte(15)
      ..write(obj.excludeReblogs)
      ..writeByte(16)
      ..write(obj.webSocketsUpdates);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelineSettings _$TimelineSettingsFromJson(Map<String, dynamic> json) {
  return TimelineSettings(
    onlyWithMedia: json['only_with_media'] as bool,
    excludeReplies: json['exclude_replies'] as bool,
    excludeNsfwSensitive: json['exclude_nsfw_sensitive'] as bool,
    onlyRemote: json['only_remote'] as bool,
    onlyLocal: json['only_local'] as bool,
    withMuted: json['with_muted'] as bool,
    excludeVisibilitiesStrings: (json['exclude_visibilities_strings'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    onlyInRemoteList: json['only_in_list'] == null
        ? null
        : PleromaList.fromJson(json['only_in_list'] as Map<String, dynamic>),
    withRemoteHashtag: json['with_remote_hashtag'] as String,
    replyVisibilityFilterString:
        json['reply_visibility_filter_string'] as String,
    onlyFromRemoteAccount: json['only_from_remote_account'] == null
        ? null
        : PleromaAccount.fromJson(
            json['only_from_remote_account'] as Map<String, dynamic>),
    onlyPinned: json['only_pinned'] as bool,
    excludeReblogs: json['exclude_reblogs'] as bool,
    webSocketsUpdates: json['web_sockets_updates'] as bool,
  );
}

Map<String, dynamic> _$TimelineSettingsToJson(TimelineSettings instance) =>
    <String, dynamic>{
      'only_with_media': instance.onlyWithMedia,
      'exclude_replies': instance.excludeReplies,
      'exclude_nsfw_sensitive': instance.excludeNsfwSensitive,
      'only_remote': instance.onlyRemote,
      'only_local': instance.onlyLocal,
      'with_muted': instance.withMuted,
      'exclude_visibilities_strings': instance.excludeVisibilitiesStrings,
      'only_in_list': instance.onlyInRemoteList?.toJson(),
      'with_remote_hashtag': instance.withRemoteHashtag,
      'reply_visibility_filter_string': instance.replyVisibilityFilterString,
      'only_from_remote_account': instance.onlyFromRemoteAccount?.toJson(),
      'only_pinned': instance.onlyPinned,
      'exclude_reblogs': instance.excludeReblogs,
      'web_sockets_updates': instance.webSocketsUpdates,
    };
