// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_sensitive_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusSensitiveSettingsAdapter
    extends TypeAdapter<StatusSensitiveSettings> {
  @override
  final int typeId = 53;

  @override
  StatusSensitiveSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatusSensitiveSettings(
      isAlwaysShowSpoiler: fields[0] as bool,
      isAlwaysShowNsfw: fields[1] as bool,
      nsfwDisplayDelayDurationMicrosecondsTotal: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, StatusSensitiveSettings obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isAlwaysShowSpoiler)
      ..writeByte(1)
      ..write(obj.isAlwaysShowNsfw)
      ..writeByte(2)
      ..write(obj.nsfwDisplayDelayDurationMicrosecondsTotal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusSensitiveSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatusSensitiveSettings _$$_StatusSensitiveSettingsFromJson(
        Map<String, dynamic> json) =>
    _$_StatusSensitiveSettings(
      isAlwaysShowSpoiler: json['is_always_show_spoiler'] as bool,
      isAlwaysShowNsfw: json['is_always_show_nsfw'] as bool,
      nsfwDisplayDelayDurationMicrosecondsTotal:
          json['nsfw_display_delay_duration_seconds_total'] as int?,
    );

Map<String, dynamic> _$$_StatusSensitiveSettingsToJson(
    _$_StatusSensitiveSettings instance) {
  final val = <String, dynamic>{
    'is_always_show_spoiler': instance.isAlwaysShowSpoiler,
    'is_always_show_nsfw': instance.isAlwaysShowNsfw,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nsfw_display_delay_duration_seconds_total',
      instance.nsfwDisplayDelayDurationMicrosecondsTotal);
  return val;
}
