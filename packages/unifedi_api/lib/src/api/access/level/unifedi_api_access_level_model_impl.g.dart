// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_level_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessLevelAdapter extends TypeAdapter<UnifediApiAccessLevel> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessLevel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessLevel(
      stringValue: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessLevel obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.stringValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAccessLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessLevel _$$_UnifediApiAccessLevelFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAccessLevel(
      stringValue: json['string_value'] as String,
    );

Map<String, dynamic> _$$_UnifediApiAccessLevelToJson(
        _$_UnifediApiAccessLevel instance) =>
    <String, dynamic>{
      'string_value': instance.stringValue,
    };
