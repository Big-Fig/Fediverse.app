// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_limits_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceLimitsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceLimitsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceLimitsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceLimitsPleromaAdapter(
      fields[0] as PleromaApiInstance,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceLimitsPleromaAdapter obj) {
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
      other is UnifediApiInstanceLimitsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceLimitsPleromaAdapter
    _$$_UnifediApiInstanceLimitsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceLimitsPleromaAdapter(
          PleromaApiInstance.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceLimitsPleromaAdapterToJson(
        _$_UnifediApiInstanceLimitsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
