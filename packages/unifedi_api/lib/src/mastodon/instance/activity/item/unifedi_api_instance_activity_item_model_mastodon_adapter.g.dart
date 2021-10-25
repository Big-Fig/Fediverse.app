// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_activity_item_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceActivityItemMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceActivityItemMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceActivityItemMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceActivityItemMastodonAdapter(
      fields[0] as MastodonApiInstanceActivityItem,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiInstanceActivityItemMastodonAdapter obj) {
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
      other is UnifediApiInstanceActivityItemMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceActivityItemMastodonAdapter
    _$$_UnifediApiInstanceActivityItemMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceActivityItemMastodonAdapter(
          MastodonApiInstanceActivityItem.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceActivityItemMastodonAdapterToJson(
        _$_UnifediApiInstanceActivityItemMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
