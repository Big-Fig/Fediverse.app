// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_federation_mfr_object_age_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceFederationMfrObjectAgePleromaAdapterAdapter
    extends TypeAdapter<
        UnifediApiInstanceFederationMfrObjectAgePleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceFederationMfrObjectAgePleromaAdapter read(
      BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceFederationMfrObjectAgePleromaAdapter(
      fields[0] as PleromaApiInstanceFederationMfrObjectAge,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiInstanceFederationMfrObjectAgePleromaAdapter obj) {
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
      other is UnifediApiInstanceFederationMfrObjectAgePleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceFederationMfrObjectAgePleromaAdapter
    _$$_UnifediApiInstanceFederationMfrObjectAgePleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiInstanceFederationMfrObjectAgePleromaAdapter(
          PleromaApiInstanceFederationMfrObjectAge.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String,
    dynamic> _$$_UnifediApiInstanceFederationMfrObjectAgePleromaAdapterToJson(
        _$_UnifediApiInstanceFederationMfrObjectAgePleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
