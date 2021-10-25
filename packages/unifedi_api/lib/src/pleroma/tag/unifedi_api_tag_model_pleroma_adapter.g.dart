// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_tag_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiTagPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiTagPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiTagPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiTagPleromaAdapter(
      fields[0] as PleromaApiTag,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiTagPleromaAdapter obj) {
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
      other is UnifediApiTagPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiTagPleromaAdapter _$$_UnifediApiTagPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiTagPleromaAdapter(
      PleromaApiTag.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiTagPleromaAdapterToJson(
        _$_UnifediApiTagPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
