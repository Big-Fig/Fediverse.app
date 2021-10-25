// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_list_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiListPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiListPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiListPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiListPleromaAdapter(
      fields[0] as PleromaApiList,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiListPleromaAdapter obj) {
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
      other is UnifediApiListPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiListPleromaAdapter _$$_UnifediApiListPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiListPleromaAdapter(
      PleromaApiList.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiListPleromaAdapterToJson(
        _$_UnifediApiListPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
