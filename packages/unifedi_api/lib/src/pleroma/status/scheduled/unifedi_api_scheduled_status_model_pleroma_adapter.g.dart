// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_scheduled_status_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiScheduledStatusPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiScheduledStatusPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiScheduledStatusPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiScheduledStatusPleromaAdapter(
      fields[0] as PleromaApiScheduledStatus,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiScheduledStatusPleromaAdapter obj) {
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
      other is UnifediApiScheduledStatusPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiScheduledStatusPleromaAdapter
    _$$_UnifediApiScheduledStatusPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiScheduledStatusPleromaAdapter(
          PleromaApiScheduledStatus.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiScheduledStatusPleromaAdapterToJson(
        _$_UnifediApiScheduledStatusPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
