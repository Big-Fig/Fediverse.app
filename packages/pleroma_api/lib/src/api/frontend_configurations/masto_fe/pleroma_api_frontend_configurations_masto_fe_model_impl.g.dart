// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_frontend_configurations_masto_fe_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiFrontendConfigurationsMastoFeAdapter
    extends TypeAdapter<PleromaApiFrontendConfigurationsMastoFe> {
  @override
  final int typeId = 0;

  @override
  PleromaApiFrontendConfigurationsMastoFe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiFrontendConfigurationsMastoFe(
      showInstanceSpecificPanel: fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiFrontendConfigurationsMastoFe obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.showInstanceSpecificPanel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiFrontendConfigurationsMastoFeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiFrontendConfigurationsMastoFe
    _$$_PleromaApiFrontendConfigurationsMastoFeFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiFrontendConfigurationsMastoFe(
          showInstanceSpecificPanel:
              json['show_instance_specific_panel'] as bool?,
        );

Map<String, dynamic> _$$_PleromaApiFrontendConfigurationsMastoFeToJson(
    _$_PleromaApiFrontendConfigurationsMastoFe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'show_instance_specific_panel', instance.showInstanceSpecificPanel);
  return val;
}
