// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_list_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiListMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiListMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiListMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiListMastodonAdapter(
      fields[0] as MastodonApiList,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiListMastodonAdapter obj) {
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
      other is UnifediApiListMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiListMastodonAdapter _$$_UnifediApiListMastodonAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiListMastodonAdapter(
      MastodonApiList.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiListMastodonAdapterToJson(
        _$_UnifediApiListMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
