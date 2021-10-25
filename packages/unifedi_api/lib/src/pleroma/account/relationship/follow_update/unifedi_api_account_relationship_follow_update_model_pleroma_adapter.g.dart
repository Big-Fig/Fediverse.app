// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_relationship_follow_update_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountRelationshipFollowUpdatePleromaAdapterAdapter
    extends TypeAdapter<
        UnifediApiAccountRelationshipFollowUpdatePleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountRelationshipFollowUpdatePleromaAdapter read(
      BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountRelationshipFollowUpdatePleromaAdapter(
      fields[0] as PleromaApiAccountRelationshipFollowUpdate,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiAccountRelationshipFollowUpdatePleromaAdapter obj) {
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
      other is UnifediApiAccountRelationshipFollowUpdatePleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountRelationshipFollowUpdatePleromaAdapter
    _$$_UnifediApiAccountRelationshipFollowUpdatePleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccountRelationshipFollowUpdatePleromaAdapter(
          PleromaApiAccountRelationshipFollowUpdate.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String,
    dynamic> _$$_UnifediApiAccountRelationshipFollowUpdatePleromaAdapterToJson(
        _$_UnifediApiAccountRelationshipFollowUpdatePleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
