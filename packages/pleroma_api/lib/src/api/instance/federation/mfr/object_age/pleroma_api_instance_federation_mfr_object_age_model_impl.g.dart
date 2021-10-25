// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_instance_federation_mfr_object_age_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiInstanceFederationMfrObjectAgeAdapter
    extends TypeAdapter<PleromaApiInstanceFederationMfrObjectAge> {
  @override
  final int typeId = 0;

  @override
  PleromaApiInstanceFederationMfrObjectAge read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstanceFederationMfrObjectAge(
      threshold: fields[0] as int?,
      actions: (fields[1] as List?)?.cast<String>(),
    );
  }

  @override
  void write(
      BinaryWriter writer, PleromaApiInstanceFederationMfrObjectAge obj) {
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
      other is PleromaApiInstanceFederationMfrObjectAgeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiInstanceFederationMfrObjectAge
    _$$_PleromaApiInstanceFederationMfrObjectAgeFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiInstanceFederationMfrObjectAge(
          threshold: json['threshold'] as int?,
          actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
        );

Map<String, dynamic> _$$_PleromaApiInstanceFederationMfrObjectAgeToJson(
    _$_PleromaApiInstanceFederationMfrObjectAge instance) {
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
