// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_federation_mfr_object_age_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceFederationMfrObjectAgeAdapter
    extends TypeAdapter<UnifediApiInstanceFederationMfrObjectAge> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceFederationMfrObjectAge read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceFederationMfrObjectAge(
      threshold: fields[0] as int?,
      actions: (fields[1] as List?)?.cast<String>(),
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiInstanceFederationMfrObjectAge obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.threshold)
      ..writeByte(1)
      ..write(obj.actions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiInstanceFederationMfrObjectAgeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceFederationMfrObjectAge
    _$$_UnifediApiInstanceFederationMfrObjectAgeFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceFederationMfrObjectAge(
          threshold: json['threshold'] as int?,
          actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$$_UnifediApiInstanceFederationMfrObjectAgeToJson(
    _$_UnifediApiInstanceFederationMfrObjectAge instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('threshold', instance.threshold);
  writeNotNull('actions', instance.actions);
  return val;
}
