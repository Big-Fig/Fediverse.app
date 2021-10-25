// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_status_limits_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceStatusLimitsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceStatusLimitsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceStatusLimitsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceStatusLimitsPleromaAdapter(
      fields[0] as PleromaApiInstance,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiInstanceStatusLimitsPleromaAdapter obj) {
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
      other is UnifediApiInstanceStatusLimitsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceStatusLimitsPleromaAdapter
    _$$_UnifediApiInstanceStatusLimitsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceStatusLimitsPleromaAdapter(
          PleromaApiInstance.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceStatusLimitsPleromaAdapterToJson(
        _$_UnifediApiInstanceStatusLimitsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
