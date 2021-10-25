// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_card_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiCardPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiCardPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiCardPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiCardPleromaAdapter(
      fields[0] as PleromaApiCard,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiCardPleromaAdapter obj) {
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
      other is UnifediApiCardPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiCardPleromaAdapter _$$_UnifediApiCardPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiCardPleromaAdapter(
      PleromaApiCard.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiCardPleromaAdapterToJson(
        _$_UnifediApiCardPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
