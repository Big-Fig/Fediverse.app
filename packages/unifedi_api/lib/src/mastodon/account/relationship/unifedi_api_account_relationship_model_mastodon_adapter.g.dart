// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_relationship_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountRelationshipMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAccountRelationshipMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountRelationshipMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountRelationshipMastodonAdapter(
      fields[0] as MastodonApiAccountRelationship,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiAccountRelationshipMastodonAdapter obj) {
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
      other is UnifediApiAccountRelationshipMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountRelationshipMastodonAdapter
    _$$_UnifediApiAccountRelationshipMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccountRelationshipMastodonAdapter(
          MastodonApiAccountRelationship.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccountRelationshipMastodonAdapterToJson(
        _$_UnifediApiAccountRelationshipMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
