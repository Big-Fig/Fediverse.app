// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_scopes_item_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessScopesItemMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccessScopesItemMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessScopesItemMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessScopesItemMastodonAdapter(
      fields[0] as MastodonApiAccessScopesItem,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccessScopesItemMastodonAdapter obj) {
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
      other is UnifediApiAccessScopesItemMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessScopesItemMastodonAdapter
    _$$_UnifediApiAccessScopesItemMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessScopesItemMastodonAdapter(
          MastodonApiAccessScopesItem.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessScopesItemMastodonAdapterToJson(
        _$_UnifediApiAccessScopesItemMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
