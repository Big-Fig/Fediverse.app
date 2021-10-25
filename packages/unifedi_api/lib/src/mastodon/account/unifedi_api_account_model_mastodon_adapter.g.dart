// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccountMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountMastodonAdapter(
      fields[0] as MastodonApiAccount,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccountMastodonAdapter obj) {
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
      other is UnifediApiAccountMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountMastodonAdapter
    _$$_UnifediApiAccountMastodonAdapterFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiAccountMastodonAdapter(
          MastodonApiAccount.fromJson(json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccountMastodonAdapterToJson(
        _$_UnifediApiAccountMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
