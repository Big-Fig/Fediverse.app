// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_activity_item_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceActivityItemPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceActivityItemPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceActivityItemPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceActivityItemPleromaAdapter(
      fields[0] as PleromaApiInstanceActivityItem,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiInstanceActivityItemPleromaAdapter obj) {
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
      other is UnifediApiInstanceActivityItemPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceActivityItemPleromaAdapter
    _$$_UnifediApiInstanceActivityItemPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceActivityItemPleromaAdapter(
          PleromaApiInstanceActivityItem.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceActivityItemPleromaAdapterToJson(
        _$_UnifediApiInstanceActivityItemPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
