// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_instance_metadata_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiInstanceMetadataAdapter
    extends TypeAdapter<PleromaApiInstanceMetadata> {
  @override
  final int typeId = 0;

  @override
  PleromaApiInstanceMetadata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstanceMetadata(
      features: (fields[0] as List?)?.cast<String>(),
      postFormats: (fields[2] as List?)?.cast<String>(),
      accountActivationRequired: fields[3] as bool?,
      fieldsLimits: fields[4] as PleromaApiInstanceFieldLimits?,
      federation: fields[5] as PleromaApiInstanceFederation?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstanceMetadata obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.features)
      ..writeByte(2)
      ..write(obj.postFormats)
      ..writeByte(3)
      ..write(obj.accountActivationRequired)
      ..writeByte(4)
      ..write(obj.fieldsLimits)
      ..writeByte(5)
      ..write(obj.federation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiInstanceMetadataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiInstanceMetadata _$$_PleromaApiInstanceMetadataFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiInstanceMetadata(
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      postFormats: (json['post_formats'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      accountActivationRequired: json['account_activation_required'] as bool?,
      fieldsLimits: json['fields_limits'] == null
          ? null
          : PleromaApiInstanceFieldLimits.fromJson(
              json['fields_limits'] as Map<String, dynamic>),
      federation: json['federation'] == null
          ? null
          : PleromaApiInstanceFederation.fromJson(
              json['federation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiInstanceMetadataToJson(
    _$_PleromaApiInstanceMetadata instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('features', instance.features);
  writeNotNull('post_formats', instance.postFormats);
  writeNotNull(
      'account_activation_required', instance.accountActivationRequired);
  writeNotNull('fields_limits', instance.fieldsLimits?.toJson());
  writeNotNull('federation', instance.federation?.toJson());
  return val;
}
