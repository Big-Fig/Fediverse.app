// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_schedule_post_status_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiSchedulePostStatusPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiSchedulePostStatusPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiSchedulePostStatusPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiSchedulePostStatusPleromaAdapter(
      fields[0] as PleromaApiSchedulePostStatus,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiSchedulePostStatusPleromaAdapter obj) {
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
      other is UnifediApiSchedulePostStatusPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiSchedulePostStatusPleromaAdapter
    _$$_UnifediApiSchedulePostStatusPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiSchedulePostStatusPleromaAdapter(
          PleromaApiSchedulePostStatus.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiSchedulePostStatusPleromaAdapterToJson(
        _$_UnifediApiSchedulePostStatusPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
