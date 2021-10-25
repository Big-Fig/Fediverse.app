// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_status_context_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiStatusContextPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiStatusContextPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiStatusContextPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiStatusContextPleromaAdapter(
      fields[0] as PleromaApiStatusContext,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiStatusContextPleromaAdapter obj) {
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
      other is UnifediApiStatusContextPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiStatusContextPleromaAdapter
    _$$_UnifediApiStatusContextPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiStatusContextPleromaAdapter(
          PleromaApiStatusContext.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiStatusContextPleromaAdapterToJson(
        _$_UnifediApiStatusContextPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
