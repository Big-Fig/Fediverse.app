// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstancePleromaAdapterAdapter
    extends TypeAdapter<UnifediApiInstancePleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstancePleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstancePleromaAdapter(
      fields[0] as PleromaApiInstance,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstancePleromaAdapter obj) {
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
      other is UnifediApiInstancePleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstancePleromaAdapter
    _$$_UnifediApiInstancePleromaAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiInstancePleromaAdapter(
          PleromaApiInstance.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstancePleromaAdapterToJson(
        _$_UnifediApiInstancePleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
