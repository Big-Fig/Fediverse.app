// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_urls_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceUrlsMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiInstanceUrlsMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceUrlsMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceUrlsMastodonAdapter(
      fields[0] as MastodonApiInstanceUrls,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceUrlsMastodonAdapter obj) {
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
      other is UnifediApiInstanceUrlsMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceUrlsMastodonAdapter
    _$$_UnifediApiInstanceUrlsMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceUrlsMastodonAdapter(
          MastodonApiInstanceUrls.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiInstanceUrlsMastodonAdapterToJson(
        _$_UnifediApiInstanceUrlsMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
