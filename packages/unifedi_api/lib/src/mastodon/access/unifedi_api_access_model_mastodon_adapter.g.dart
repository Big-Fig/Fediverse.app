// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccessMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessMastodonAdapter(
      fields[0] as MastodonApiAccess,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessMastodonAdapter obj) {
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
      other is UnifediApiAccessMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessMastodonAdapter _$$_UnifediApiAccessMastodonAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAccessMastodonAdapter(
      MastodonApiAccess.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiAccessMastodonAdapterToJson(
        _$_UnifediApiAccessMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
