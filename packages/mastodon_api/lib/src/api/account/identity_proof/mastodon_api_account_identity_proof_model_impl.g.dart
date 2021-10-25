// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_account_identity_proof_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiAccountIdentityProofAdapter
    extends TypeAdapter<MastodonApiAccountIdentityProof> {
  @override
  final int typeId = 0;

  @override
  MastodonApiAccountIdentityProof read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiAccountIdentityProof(
      profileUrl: fields[0] as String?,
      proofUrl: fields[1] as String?,
      provider: fields[2] as String?,
      providerUsername: fields[3] as String?,
      updatedAt: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiAccountIdentityProof obj) {
    writer
      ..writeByte(5)
      ..writeByte(2)
      ..write(obj.provider)
      ..writeByte(3)
      ..write(obj.providerUsername)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(1)
      ..write(obj.proofUrl)
      ..writeByte(0)
      ..write(obj.profileUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiAccountIdentityProofAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiAccountIdentityProof _$$_MastodonApiAccountIdentityProofFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiAccountIdentityProof(
      profileUrl: json['profile_url'] as String?,
      proofUrl: json['proof_url'] as String?,
      provider: json['provider'] as String?,
      providerUsername: json['provider_username'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_MastodonApiAccountIdentityProofToJson(
    _$_MastodonApiAccountIdentityProof instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('profile_url', instance.profileUrl);
  writeNotNull('proof_url', instance.proofUrl);
  writeNotNull('provider', instance.provider);
  writeNotNull('provider_username', instance.providerUsername);
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}
