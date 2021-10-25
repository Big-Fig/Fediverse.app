// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_relationship_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountRelationshipPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccountRelationshipPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountRelationshipPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountRelationshipPleromaAdapter(
      fields[0] as PleromaApiAccountRelationship,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccountRelationshipPleromaAdapter obj) {
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
      other is UnifediApiAccountRelationshipPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountRelationshipPleromaAdapter
    _$$_UnifediApiAccountRelationshipPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccountRelationshipPleromaAdapter(
          PleromaApiAccountRelationship.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccountRelationshipPleromaAdapterToJson(
        _$_UnifediApiAccountRelationshipPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
