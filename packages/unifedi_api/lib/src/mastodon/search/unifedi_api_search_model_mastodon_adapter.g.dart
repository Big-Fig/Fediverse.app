// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_search_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiSearchResultMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiSearchResultMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiSearchResultMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiSearchResultMastodonAdapter(
      fields[0] as MastodonApiSearchResult,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiSearchResultMastodonAdapter obj) {
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
      other is UnifediApiSearchResultMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiSearchResultMastodonAdapter
    _$$_UnifediApiSearchResultMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiSearchResultMastodonAdapter(
          MastodonApiSearchResult.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiSearchResultMastodonAdapterToJson(
        _$_UnifediApiSearchResultMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
