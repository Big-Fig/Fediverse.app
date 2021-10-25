// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_relationship_follow_update_item_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapterAdapter
    extends TypeAdapter<
        UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter read(
      BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter(
      fields[0] as PleromaApiAccountRelationshipFollowUpdateItem,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter obj) {
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
      other is UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter
    _$$_UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter(
          PleromaApiAccountRelationshipFollowUpdateItem.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$_UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapterToJson(
            _$_UnifediApiAccountRelationshipFollowUpdateItemPleromaAdapter
                instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
        };
