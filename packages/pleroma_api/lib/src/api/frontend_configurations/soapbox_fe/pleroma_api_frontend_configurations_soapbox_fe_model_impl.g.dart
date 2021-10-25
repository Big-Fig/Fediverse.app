// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_frontend_configurations_soapbox_fe_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiFrontendConfigurationsSoapboxFeAdapter
    extends TypeAdapter<PleromaApiFrontendConfigurationsSoapboxFe> {
  @override
  final int typeId = 0;

  @override
  PleromaApiFrontendConfigurationsSoapboxFe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiFrontendConfigurationsSoapboxFe(
      brandColor: fields[0] as String?,
    );
  }

  @override
  void write(
      BinaryWriter writer, PleromaApiFrontendConfigurationsSoapboxFe obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.brandColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiFrontendConfigurationsSoapboxFeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiFrontendConfigurationsSoapboxFe
    _$$_PleromaApiFrontendConfigurationsSoapboxFeFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiFrontendConfigurationsSoapboxFe(
          brandColor: json['brandColor'] as String?,
        );

Map<String, dynamic> _$$_PleromaApiFrontendConfigurationsSoapboxFeToJson(
    _$_PleromaApiFrontendConfigurationsSoapboxFe instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brandColor', instance.brandColor);
  return val;
}
