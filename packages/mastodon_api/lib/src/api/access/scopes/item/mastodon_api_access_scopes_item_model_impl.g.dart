// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_access_scopes_item_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiAccessScopesItemAdapter
    extends TypeAdapter<MastodonApiAccessScopesItem> {
  @override
  final int typeId = 0;

  @override
  MastodonApiAccessScopesItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiAccessScopesItem(
      permission: fields[0] as String,
      target: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiAccessScopesItem obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.permission)
      ..writeByte(1)
      ..write(obj.target);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiAccessScopesItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiAccessScopesItem _$$_MastodonApiAccessScopesItemFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiAccessScopesItem(
      permission: json['permission'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$$_MastodonApiAccessScopesItemToJson(
        _$_MastodonApiAccessScopesItem instance) =>
    <String, dynamic>{
      'permission': instance.permission,
      'target': instance.target,
    };
