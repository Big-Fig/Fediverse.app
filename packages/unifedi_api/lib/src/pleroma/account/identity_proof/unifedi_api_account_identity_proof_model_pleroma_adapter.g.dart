// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_identity_proof_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountIdentityProofPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccountIdentityProofPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountIdentityProofPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountIdentityProofPleromaAdapter(
      fields[0] as PleromaApiAccountIdentityProof,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccountIdentityProofPleromaAdapter obj) {
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
      other is UnifediApiAccountIdentityProofPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountIdentityProofPleromaAdapter
    _$$_UnifediApiAccountIdentityProofPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccountIdentityProofPleromaAdapter(
          PleromaApiAccountIdentityProof.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccountIdentityProofPleromaAdapterToJson(
        _$_UnifediApiAccountIdentityProofPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
