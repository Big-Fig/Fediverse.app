// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_account_relationship_follow_update_item_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccountRelationshipFollowUpdateItemAdapter
    extends TypeAdapter<PleromaApiAccountRelationshipFollowUpdateItem> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccountRelationshipFollowUpdateItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccountRelationshipFollowUpdateItem(
      accountId: fields[1] as String,
      followerCount: fields[2] as int?,
      followingCount: fields[3] as int?,
    );
  }

  @override
  void write(
      BinaryWriter writer, PleromaApiAccountRelationshipFollowUpdateItem obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.accountId)
      ..writeByte(2)
      ..write(obj.followerCount)
      ..writeByte(3)
      ..write(obj.followingCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountRelationshipFollowUpdateItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccountRelationshipFollowUpdateItem
    _$$_PleromaApiAccountRelationshipFollowUpdateItemFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiAccountRelationshipFollowUpdateItem(
          accountId: json['id'] as String,
          followerCount: json['follower_count'] as int?,
          followingCount: json['following_count'] as int?,
        );

Map<String, dynamic> _$$_PleromaApiAccountRelationshipFollowUpdateItemToJson(
    _$_PleromaApiAccountRelationshipFollowUpdateItem instance) {
  final val = <String, dynamic>{
    'id': instance.accountId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('follower_count', instance.followerCount);
  writeNotNull('following_count', instance.followingCount);
  return val;
}
