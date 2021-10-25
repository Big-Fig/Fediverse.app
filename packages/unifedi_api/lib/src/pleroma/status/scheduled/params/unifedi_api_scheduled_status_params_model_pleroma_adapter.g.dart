// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_scheduled_status_params_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiScheduledStatusParamsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiScheduledStatusParamsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiScheduledStatusParamsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiScheduledStatusParamsPleromaAdapter(
      fields[0] as PleromaApiScheduledStatusParams,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiScheduledStatusParamsPleromaAdapter obj) {
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
      other is UnifediApiScheduledStatusParamsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiScheduledStatusParamsPleromaAdapter
    _$$_UnifediApiScheduledStatusParamsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiScheduledStatusParamsPleromaAdapter(
          PleromaApiScheduledStatusParams.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiScheduledStatusParamsPleromaAdapterToJson(
        _$_UnifediApiScheduledStatusParamsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
