// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_level_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessLevelPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccessLevelPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessLevelPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessLevelPleromaAdapter(
      fields[0] as PleromaApiAccessLevel,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessLevelPleromaAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAccessLevelPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessLevelPleromaAdapter
    _$$_UnifediApiAccessLevelPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessLevelPleromaAdapter(
          PleromaApiAccessLevel.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessLevelPleromaAdapterToJson(
        _$_UnifediApiAccessLevelPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
