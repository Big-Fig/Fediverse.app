// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_access_level_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccessLevelAdapter extends TypeAdapter<PleromaApiAccessLevel> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccessLevel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccessLevel(
      stringValue: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccessLevel obj) {
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
      other is PleromaApiAccessLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccessLevel _$$_PleromaApiAccessLevelFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiAccessLevel(
      stringValue: json['string_value'] as String,
    );

Map<String, dynamic> _$$_PleromaApiAccessLevelToJson(
        _$_PleromaApiAccessLevel instance) =>
    <String, dynamic>{
      'string_value': instance.stringValue,
    };
