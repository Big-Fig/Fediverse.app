// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_settings_old_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimelineSettingsOldAdapter extends TypeAdapter<TimelineSettingsOld> {
  @override
  final int typeId = 47;

  @override
  TimelineSettingsOld read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimelineSettingsOld(
      onlyWithMedia: fields[1] as bool?,
      excludeReplies: fields[2] as bool?,
      excludeNsfwSensitive: fields[3] as bool?,
      onlyRemote: fields[4] as bool?,
      onlyLocal: fields[5] as bool?,
      withMuted: fields[6] as bool?,
      excludeVisibilitiesStrings: (fields[7] as List?)?.cast<String>(),
      onlyInRemoteList: fields[9] as PleromaApiList?,
      withRemoteHashtag: fields[10] as String?,
      replyVisibilityFilterString: fields[11] as String?,
      onlyFromRemoteAccount: fields[13] as PleromaApiAccount?,
      onlyPinned: fields[14] as bool?,
      excludeReblogs: fields[15] as bool?,
      webSocketsUpdates: fields[16] as bool?,
      onlyFromInstance: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TimelineSettingsOld obj) {
    writer
      ..writeByte(15)
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
      ..write(obj.webSocketsUpdates)
      ..writeByte(17)
      ..write(obj.onlyFromInstance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimelineSettingsOldAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelineSettingsOld _$TimelineSettingsOldFromJson(Map<String, dynamic> json) {
  return TimelineSettingsOld(
    onlyWithMedia: json['only_with_media'] as bool?,
    excludeReplies: json['exclude_replies'] as bool?,
    excludeNsfwSensitive: json['exclude_nsfw_sensitive'] as bool?,
    onlyRemote: json['only_remote'] as bool?,
    onlyLocal: json['only_local'] as bool?,
    withMuted: json['with_muted'] as bool?,
    excludeVisibilitiesStrings:
        (json['exclude_visibilities_strings'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    onlyInRemoteList: json['only_in_list'] == null
        ? null
        : PleromaApiList.fromJson(json['only_in_list'] as Map<String, dynamic>),
    withRemoteHashtag: json['with_remote_hashtag'] as String?,
    replyVisibilityFilterString:
        json['reply_visibility_filter_string'] as String?,
    onlyFromRemoteAccount: json['only_from_remote_account'] == null
        ? null
        : PleromaApiAccount.fromJson(
            json['only_from_remote_account'] as Map<String, dynamic>),
    onlyPinned: json['only_pinned'] as bool?,
    excludeReblogs: json['exclude_reblogs'] as bool?,
    webSocketsUpdates: json['web_sockets_updates'] as bool?,
    onlyFromInstance: json['instance'] as String?,
  );
}

Map<String, dynamic> _$TimelineSettingsOldToJson(
        TimelineSettingsOld instance) =>
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
      'instance': instance.onlyFromInstance,
    };