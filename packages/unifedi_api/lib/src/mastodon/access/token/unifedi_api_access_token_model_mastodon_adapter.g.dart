// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_token_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessTokenMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccessTokenMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessTokenMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessTokenMastodonAdapter(
      fields[0] as MastodonApiAccessToken,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccessTokenMastodonAdapter obj) {
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
      other is UnifediApiAccessTokenMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessTokenMastodonAdapter
    _$$_UnifediApiAccessTokenMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessTokenMastodonAdapter(
          MastodonApiAccessToken.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessTokenMastodonAdapterToJson(
        _$_UnifediApiAccessTokenMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
