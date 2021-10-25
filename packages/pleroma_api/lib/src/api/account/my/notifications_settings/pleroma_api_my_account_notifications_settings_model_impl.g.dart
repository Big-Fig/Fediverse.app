// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_my_account_notifications_settings_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiMyAccountNotificationsSettingsAdapter
    extends TypeAdapter<PleromaApiMyAccountNotificationsSettings> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMyAccountNotificationsSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMyAccountNotificationsSettings(
      followers: fields[0] as bool?,
      follows: fields[1] as bool?,
      nonFollowers: fields[2] as bool?,
      nonFollows: fields[3] as bool?,
      blockFromStrangers: fields[4] as bool?,
      hideNotificationContents: fields[5] as bool?,
    );
  }

  @override
  void write(
      BinaryWriter writer, PleromaApiMyAccountNotificationsSettings obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.followers)
      ..writeByte(1)
      ..write(obj.follows)
      ..writeByte(2)
      ..write(obj.nonFollowers)
      ..writeByte(3)
      ..write(obj.nonFollows)
      ..writeByte(4)
      ..write(obj.blockFromStrangers)
      ..writeByte(5)
      ..write(obj.hideNotificationContents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMyAccountNotificationsSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiMyAccountNotificationsSettings
    _$$_PleromaApiMyAccountNotificationsSettingsFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiMyAccountNotificationsSettings(
          followers: json['followers'] as bool?,
          follows: json['follows'] as bool?,
          nonFollowers: json['non_followers'] as bool?,
          nonFollows: json['non_follows'] as bool?,
          blockFromStrangers: json['block_from_strangers'] as bool?,
          hideNotificationContents: json['hide_notification_contents'] as bool?,
        );

Map<String, dynamic> _$$_PleromaApiMyAccountNotificationsSettingsToJson(
    _$_PleromaApiMyAccountNotificationsSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('followers', instance.followers);
  writeNotNull('follows', instance.follows);
  writeNotNull('non_followers', instance.nonFollowers);
  writeNotNull('non_follows', instance.nonFollows);
  writeNotNull('block_from_strangers', instance.blockFromStrangers);
  writeNotNull('hide_notification_contents', instance.hideNotificationContents);
  return val;
}
