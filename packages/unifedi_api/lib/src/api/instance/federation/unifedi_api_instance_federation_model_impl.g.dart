// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_federation_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceFederationAdapter
    extends TypeAdapter<UnifediApiInstanceFederation> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceFederation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceFederation(
      enabled: fields[0] as bool?,
      exclusions: fields[1] as bool?,
      mrfObjectAge: fields[2] as UnifediApiInstanceFederationMfrObjectAge?,
      mrfPolicies: (fields[3] as List?)?.cast<String>(),
      quarantinedInstances: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceFederation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.enabled)
      ..writeByte(1)
      ..write(obj.exclusions)
      ..writeByte(2)
      ..write(obj.mrfObjectAge)
      ..writeByte(3)
      ..write(obj.mrfPolicies)
      ..writeByte(4)
      ..write(obj.quarantinedInstances);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiInstanceFederationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceFederation _$$_UnifediApiInstanceFederationFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstanceFederation(
      enabled: json['enabled'] as bool?,
      exclusions: json['exclusions'] as bool?,
      mrfObjectAge: json['mrf_object_age'] == null
          ? null
          : UnifediApiInstanceFederationMfrObjectAge.fromJson(
              json['mrf_object_age'] as Map<String, dynamic>),
      mrfPolicies: (json['mrf_policies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      quarantinedInstances: (json['quarantined_instances'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_UnifediApiInstanceFederationToJson(
    _$_UnifediApiInstanceFederation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('enabled', instance.enabled);
  writeNotNull('exclusions', instance.exclusions);
  writeNotNull('mrf_object_age', instance.mrfObjectAge?.toJson());
  writeNotNull('mrf_policies', instance.mrfPolicies);
  writeNotNull('quarantined_instances', instance.quarantinedInstances);
  return val;
}
