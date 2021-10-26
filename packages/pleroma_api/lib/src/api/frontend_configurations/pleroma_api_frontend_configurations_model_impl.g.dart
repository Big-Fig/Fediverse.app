// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_frontend_configurations_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiFrontendConfigurationsAdapter
    extends TypeAdapter<PleromaApiFrontendConfigurations> {
  @override
  final int typeId = 0;

  @override
  PleromaApiFrontendConfigurations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiFrontendConfigurations(
      mastoFe: fields[0] as PleromaApiFrontendConfigurationsMastoFe?,
      pleromaFe: fields[1] as PleromaApiFrontendConfigurationsPleromaFe?,
      soapboxFe: fields[2] as PleromaApiFrontendConfigurationsSoapboxFe?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiFrontendConfigurations obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.mastoFe)
      ..writeByte(1)
      ..write(obj.pleromaFe)
      ..writeByte(2)
      ..write(obj.soapboxFe);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiFrontendConfigurationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiFrontendConfigurations
    _$$_PleromaApiFrontendConfigurationsFromJson(Map<String, dynamic> json) =>
        _$_PleromaApiFrontendConfigurations(
          mastoFe: json['masto_fe'] == null
              ? null
              : PleromaApiFrontendConfigurationsMastoFe.fromJson(
                  json['masto_fe'] as Map<String, dynamic>),
          pleromaFe: json['pleroma_fe'] == null
              ? null
              : PleromaApiFrontendConfigurationsPleromaFe.fromJson(
                  json['pleroma_fe'] as Map<String, dynamic>),
          soapboxFe: json['soapbox_fe'] == null
              ? null
              : PleromaApiFrontendConfigurationsSoapboxFe.fromJson(
                  json['soapbox_fe'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_PleromaApiFrontendConfigurationsToJson(
    _$_PleromaApiFrontendConfigurations instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('masto_fe', instance.mastoFe?.toJson());
  writeNotNull('pleroma_fe', instance.pleromaFe?.toJson());
  writeNotNull('soapbox_fe', instance.soapboxFe?.toJson());
  return val;
}
