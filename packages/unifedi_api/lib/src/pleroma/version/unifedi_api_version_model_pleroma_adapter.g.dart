// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_version_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiVersionPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiVersionPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiVersionPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiVersionPleromaAdapter(
      fields[0] as PleromaApiVersion,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiVersionPleromaAdapter obj) {
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
      other is UnifediApiVersionPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiVersionPleromaAdapter _$$_UnifediApiVersionPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiVersionPleromaAdapter(
      PleromaApiVersion.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiVersionPleromaAdapterToJson(
        _$_UnifediApiVersionPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
