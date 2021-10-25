// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_my_account_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMyAccountMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiMyAccountMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMyAccountMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMyAccountMastodonAdapter(
      fields[0] as MastodonApiMyAccount,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMyAccountMastodonAdapter obj) {
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
      other is UnifediApiMyAccountMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMyAccountMastodonAdapter
    _$$_UnifediApiMyAccountMastodonAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiMyAccountMastodonAdapter(
          MastodonApiMyAccount.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiMyAccountMastodonAdapterToJson(
        _$_UnifediApiMyAccountMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
