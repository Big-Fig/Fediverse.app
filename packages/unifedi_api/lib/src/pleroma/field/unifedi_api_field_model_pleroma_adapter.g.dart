// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_field_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiFieldPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiFieldPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiFieldPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiFieldPleromaAdapter(
      fields[0] as PleromaApiField,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiFieldPleromaAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.valueField);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiFieldPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiFieldPleromaAdapter _$$_UnifediApiFieldPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiFieldPleromaAdapter(
      PleromaApiField.fromJson(json['valueField'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiFieldPleromaAdapterToJson(
        _$_UnifediApiFieldPleromaAdapter instance) =>
    <String, dynamic>{
      'valueField': instance.valueField.toJson(),
    };
