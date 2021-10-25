// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_poll_limits_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstancePollLimitsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiInstancePollLimitsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstancePollLimitsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstancePollLimitsPleromaAdapter(
      fields[0] as PleromaApiInstancePollLimits,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiInstancePollLimitsPleromaAdapter obj) {
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
      other is UnifediApiInstancePollLimitsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstancePollLimitsPleromaAdapter
    _$$_UnifediApiInstancePollLimitsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstancePollLimitsPleromaAdapter(
          PleromaApiInstancePollLimits.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstancePollLimitsPleromaAdapterToJson(
        _$_UnifediApiInstancePollLimitsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
