// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_oauth_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiOAuthTokenMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiOAuthTokenMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiOAuthTokenMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiOAuthTokenMastodonAdapter(
      fields[0] as MastodonApiOAuthToken,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiOAuthTokenMastodonAdapter obj) {
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
      other is UnifediApiOAuthTokenMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiOAuthTokenMastodonAdapter
    _$$_UnifediApiOAuthTokenMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiOAuthTokenMastodonAdapter(
          MastodonApiOAuthToken.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiOAuthTokenMastodonAdapterToJson(
        _$_UnifediApiOAuthTokenMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
