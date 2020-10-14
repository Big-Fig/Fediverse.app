// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyAccountSettingsAdapter extends TypeAdapter<MyAccountSettings> {
  @override
  MyAccountSettings read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyAccountSettings(
      isRealtimeWebSocketsEnabled: fields[0] as bool,
      isNewChatsEnabled: fields[1] as bool,
      isAlwaysShowSpoiler: fields[2] as bool,
      isAlwaysShowNsfw: fields[3] as bool,
      defaultVisibility: fields[4] as String,
      markMediaNsfwByDefault: fields[5] as bool,
      foregroundSoundForChatAndDm: fields[6] as bool,
      foregroundSoundForMention: fields[7] as bool,
      mediaAutoInit: fields[8] as bool,
      mediaAutoPlay: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MyAccountSettings obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.isRealtimeWebSocketsEnabled)
      ..writeByte(1)
      ..write(obj.isNewChatsEnabled)
      ..writeByte(2)
      ..write(obj.isAlwaysShowSpoiler)
      ..writeByte(3)
      ..write(obj.isAlwaysShowNsfw)
      ..writeByte(4)
      ..write(obj.defaultVisibility)
      ..writeByte(5)
      ..write(obj.markMediaNsfwByDefault)
      ..writeByte(6)
      ..write(obj.foregroundSoundForChatAndDm)
      ..writeByte(7)
      ..write(obj.foregroundSoundForMention)
      ..writeByte(8)
      ..write(obj.mediaAutoInit)
      ..writeByte(9)
      ..write(obj.mediaAutoPlay);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyAccountSettings _$MyAccountSettingsFromJson(Map<String, dynamic> json) {
  return MyAccountSettings(
    isRealtimeWebSocketsEnabled:
        json['is_realtime_web_sockets_enabled'] as bool,
    isNewChatsEnabled: json['is_new_chats_enabled'] as bool,
    isAlwaysShowSpoiler: json['is_always_show_spoiler'] as bool,
    isAlwaysShowNsfw: json['is_always_show_nsfw'] as bool,
    defaultVisibility: json['default_visibility'] as String,
    markMediaNsfwByDefault: json['mark_media_nsfw_by_default'] as bool,
    foregroundSoundForChatAndDm:
        json['foreground_sound_for_chat_and_dm'] as bool,
    foregroundSoundForMention: json['foreground_sound_mention'] as bool,
    mediaAutoInit: json['media_auto_init'] as bool,
    mediaAutoPlay: json['media_auto_play'] as bool,
  );
}

Map<String, dynamic> _$MyAccountSettingsToJson(MyAccountSettings instance) =>
    <String, dynamic>{
      'is_realtime_web_sockets_enabled': instance.isRealtimeWebSocketsEnabled,
      'is_new_chats_enabled': instance.isNewChatsEnabled,
      'is_always_show_spoiler': instance.isAlwaysShowSpoiler,
      'is_always_show_nsfw': instance.isAlwaysShowNsfw,
      'default_visibility': instance.defaultVisibility,
      'mark_media_nsfw_by_default': instance.markMediaNsfwByDefault,
      'foreground_sound_for_chat_and_dm': instance.foregroundSoundForChatAndDm,
      'foreground_sound_mention': instance.foregroundSoundForMention,
      'media_auto_init': instance.mediaAutoInit,
      'media_auto_play': instance.mediaAutoPlay,
    };
