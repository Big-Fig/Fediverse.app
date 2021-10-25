// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_post_status_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPostStatusPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiPostStatusPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPostStatusPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPostStatusPleromaAdapter(
      fields[0] as PleromaApiPostStatus,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPostStatusPleromaAdapter obj) {
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
      other is UnifediApiPostStatusPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPostStatusPleromaAdapter
    _$$_UnifediApiPostStatusPleromaAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiPostStatusPleromaAdapter(
          PleromaApiPostStatus.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPostStatusPleromaAdapterToJson(
        _$_UnifediApiPostStatusPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
