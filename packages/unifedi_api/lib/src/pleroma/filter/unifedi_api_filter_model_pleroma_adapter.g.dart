// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_filter_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiFilterPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiFilterPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiFilterPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiFilterPleromaAdapter(
      fields[0] as PleromaApiFilter,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiFilterPleromaAdapter obj) {
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
      other is UnifediApiFilterPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiFilterPleromaAdapter _$$_UnifediApiFilterPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiFilterPleromaAdapter(
      PleromaApiFilter.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiFilterPleromaAdapterToJson(
        _$_UnifediApiFilterPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
