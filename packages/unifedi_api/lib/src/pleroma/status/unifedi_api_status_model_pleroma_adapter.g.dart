// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_status_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiStatusPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiStatusPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiStatusPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiStatusPleromaAdapter(
      fields[0] as PleromaApiStatus,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiStatusPleromaAdapter obj) {
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
      other is UnifediApiStatusPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiStatusPleromaAdapter _$$_UnifediApiStatusPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiStatusPleromaAdapter(
      PleromaApiStatus.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiStatusPleromaAdapterToJson(
        _$_UnifediApiStatusPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
