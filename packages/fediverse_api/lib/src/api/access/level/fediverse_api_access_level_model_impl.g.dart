// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fediverse_api_access_level_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FediverseApiAccessLevelAdapter
    extends TypeAdapter<FediverseApiAccessLevel> {
  @override
  final int typeId = 0;

  @override
  FediverseApiAccessLevel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FediverseApiAccessLevel(
      stringValue: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FediverseApiAccessLevel obj) {
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
      other is FediverseApiAccessLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FediverseApiAccessLevel _$$_FediverseApiAccessLevelFromJson(
        Map<String, dynamic> json) =>
    _$_FediverseApiAccessLevel(
      stringValue: json['stringValue'] as String,
    );

Map<String, dynamic> _$$_FediverseApiAccessLevelToJson(
        _$_FediverseApiAccessLevel instance) =>
    <String, dynamic>{
      'stringValue': instance.stringValue,
    };
