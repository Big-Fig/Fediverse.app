// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_post_status_poll_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPostStatusPollPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiPostStatusPollPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPostStatusPollPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPostStatusPollPleromaAdapter(
      fields[0] as PleromaApiPostStatusPoll,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPostStatusPollPleromaAdapter obj) {
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
      other is UnifediApiPostStatusPollPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPostStatusPollPleromaAdapter
    _$$_UnifediApiPostStatusPollPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPostStatusPollPleromaAdapter(
          PleromaApiPostStatusPoll.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPostStatusPollPleromaAdapterToJson(
        _$_UnifediApiPostStatusPollPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
