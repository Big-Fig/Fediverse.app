// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_relationship_follow_update_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountRelationshipFollowUpdateAdapter
    extends TypeAdapter<UnifediApiAccountRelationshipFollowUpdate> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountRelationshipFollowUpdate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountRelationshipFollowUpdate(
      state: fields[0] as String,
      follower: fields[1] as UnifediApiAccountRelationshipFollowUpdateItem,
      following: fields[2] as UnifediApiAccountRelationshipFollowUpdateItem,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccountRelationshipFollowUpdate obj) {
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
      other is UnifediApiAccountRelationshipFollowUpdateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountRelationshipFollowUpdate
    _$$_UnifediApiAccountRelationshipFollowUpdateFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccountRelationshipFollowUpdate(
          state: json['state'] as String,
          follower: UnifediApiAccountRelationshipFollowUpdateItem.fromJson(
              json['follower'] as Map<String, dynamic>),
          following: UnifediApiAccountRelationshipFollowUpdateItem.fromJson(
              json['following'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccountRelationshipFollowUpdateToJson(
        _$_UnifediApiAccountRelationshipFollowUpdate instance) =>
    <String, dynamic>{
      'state': instance.state,
      'follower': instance.follower.toJson(),
      'following': instance.following.toJson(),
    };
