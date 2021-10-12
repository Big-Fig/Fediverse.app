// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_filter_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushFilterSettingsAdapter extends TypeAdapter<PushFilterSettings> {
  @override
  final int typeId = 15;

  @override
  PushFilterSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushFilterSettings(
      blockFromStrangers: fields[1] as bool?,
      hideNotificationContents: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PushFilterSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.blockFromStrangers)
      ..writeByte(2)
      ..write(obj.hideNotificationContents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushFilterSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PushFilterSettings _$$_PushFilterSettingsFromJson(
        Map<String, dynamic> json) =>
    _$_PushFilterSettings(
      blockFromStrangers: json['blockFromStrangers'] as bool?,
      hideNotificationContents: json['hideNotificationContents'] as bool?,
    );

Map<String, dynamic> _$$_PushFilterSettingsToJson(
    _$_PushFilterSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('blockFromStrangers', instance.blockFromStrangers);
  writeNotNull('hideNotificationContents', instance.hideNotificationContents);
  return val;
}
