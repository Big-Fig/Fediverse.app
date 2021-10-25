// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_poll_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPollPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiPollPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPollPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPollPleromaAdapter(
      fields[0] as PleromaApiPoll,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPollPleromaAdapter obj) {
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
      other is UnifediApiPollPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPollPleromaAdapter _$$_UnifediApiPollPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiPollPleromaAdapter(
      PleromaApiPoll.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiPollPleromaAdapterToJson(
        _$_UnifediApiPollPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
