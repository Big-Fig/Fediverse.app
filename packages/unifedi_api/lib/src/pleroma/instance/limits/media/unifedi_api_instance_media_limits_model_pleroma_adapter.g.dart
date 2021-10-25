// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_media_limits_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceMediaLimitsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceMediaLimitsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceMediaLimitsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceMediaLimitsPleromaAdapter(
      fields[0] as PleromaApiInstance,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiInstanceMediaLimitsPleromaAdapter obj) {
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
      other is UnifediApiInstanceMediaLimitsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceMediaLimitsPleromaAdapter
    _$$_UnifediApiInstanceMediaLimitsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceMediaLimitsPleromaAdapter(
          PleromaApiInstance.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceMediaLimitsPleromaAdapterToJson(
        _$_UnifediApiInstanceMediaLimitsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
