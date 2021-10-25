// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_application_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiApplicationPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiApplicationPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiApplicationPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiApplicationPleromaAdapter(
      fields[0] as PleromaApiApplication,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiApplicationPleromaAdapter obj) {
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
      other is UnifediApiApplicationPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiApplicationPleromaAdapter
    _$$_UnifediApiApplicationPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiApplicationPleromaAdapter(
          PleromaApiApplication.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiApplicationPleromaAdapterToJson(
        _$_UnifediApiApplicationPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
