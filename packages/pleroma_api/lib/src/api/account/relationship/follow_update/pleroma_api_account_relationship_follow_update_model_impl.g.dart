// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_account_relationship_follow_update_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccountRelationshipFollowUpdateAdapter
    extends TypeAdapter<PleromaApiAccountRelationshipFollowUpdate> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccountRelationshipFollowUpdate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccountRelationshipFollowUpdate(
      state: fields[0] as String,
      follower: fields[1] as PleromaApiAccountRelationshipFollowUpdateItem,
      following: fields[2] as PleromaApiAccountRelationshipFollowUpdateItem,
    );
  }

  @override
  void write(
      BinaryWriter writer, PleromaApiAccountRelationshipFollowUpdate obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.state)
      ..writeByte(1)
      ..write(obj.follower)
      ..writeByte(2)
      ..write(obj.following);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountRelationshipFollowUpdateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccountRelationshipFollowUpdate
    _$$_PleromaApiAccountRelationshipFollowUpdateFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiAccountRelationshipFollowUpdate(
          state: json['state'] as String,
          follower: PleromaApiAccountRelationshipFollowUpdateItem.fromJson(
              json['follower'] as Map<String, dynamic>),
          following: PleromaApiAccountRelationshipFollowUpdateItem.fromJson(
              json['following'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_PleromaApiAccountRelationshipFollowUpdateToJson(
        _$_PleromaApiAccountRelationshipFollowUpdate instance) =>
    <String, dynamic>{
      'state': instance.state,
      'follower': instance.follower.toJson(),
      'following': instance.following.toJson(),
    };
