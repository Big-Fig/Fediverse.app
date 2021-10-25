// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_version_range_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiVersionRangePleromaAdapterAdapter
    extends TypeAdapter<UnifediApiVersionRangePleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiVersionRangePleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiVersionRangePleromaAdapter(
      fields[0] as PleromaApiVersionRange,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiVersionRangePleromaAdapter obj) {
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
      other is UnifediApiVersionRangePleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiVersionRangePleromaAdapter
    _$$_UnifediApiVersionRangePleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiVersionRangePleromaAdapter(
          PleromaApiVersionRange.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiVersionRangePleromaAdapterToJson(
        _$_UnifediApiVersionRangePleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
