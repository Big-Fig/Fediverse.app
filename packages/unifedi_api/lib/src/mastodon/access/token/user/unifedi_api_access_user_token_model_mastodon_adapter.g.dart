// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_access_user_token_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccessUserTokenMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccessUserTokenMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccessUserTokenMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccessUserTokenMastodonAdapter(
      fields[0] as MastodonApiAccessUserToken,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccessUserTokenMastodonAdapter obj) {
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
      other is UnifediApiAccessUserTokenMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccessUserTokenMastodonAdapter
    _$$_UnifediApiAccessUserTokenMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccessUserTokenMastodonAdapter(
          MastodonApiAccessUserToken.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccessUserTokenMastodonAdapterToJson(
        _$_UnifediApiAccessUserTokenMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
