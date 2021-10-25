// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_post_status_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiPostStatusMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiPostStatusMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiPostStatusMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiPostStatusMastodonAdapter(
      fields[0] as MastodonApiPostStatus,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiPostStatusMastodonAdapter obj) {
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
      other is UnifediApiPostStatusMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiPostStatusMastodonAdapter
    _$$_UnifediApiPostStatusMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiPostStatusMastodonAdapter(
          MastodonApiPostStatus.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiPostStatusMastodonAdapterToJson(
        _$_UnifediApiPostStatusMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
