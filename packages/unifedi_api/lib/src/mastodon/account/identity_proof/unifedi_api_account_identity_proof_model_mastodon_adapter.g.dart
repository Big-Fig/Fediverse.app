// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_identity_proof_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountIdentityProofMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccountIdentityProofMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountIdentityProofMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountIdentityProofMastodonAdapter(
      fields[0] as MastodonApiAccountIdentityProof,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccountIdentityProofMastodonAdapter obj) {
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
      other is UnifediApiAccountIdentityProofMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountIdentityProofMastodonAdapter
    _$$_UnifediApiAccountIdentityProofMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccountIdentityProofMastodonAdapter(
          MastodonApiAccountIdentityProof.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccountIdentityProofMastodonAdapterToJson(
        _$_UnifediApiAccountIdentityProofMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
