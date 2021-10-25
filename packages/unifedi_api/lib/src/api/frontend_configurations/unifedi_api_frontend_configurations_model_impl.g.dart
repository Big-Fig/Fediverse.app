// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_frontend_configurations_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiFrontendConfigurationsAdapter
    extends TypeAdapter<UnifediApiFrontendConfigurations> {
  @override
  final int typeId = 0;

  @override
  UnifediApiFrontendConfigurations read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiFrontendConfigurations(
      brandHexColor: fields[0] as String?,
      backgroundImage: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiFrontendConfigurations obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.brandHexColor)
      ..writeByte(1)
      ..write(obj.backgroundImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiFrontendConfigurationsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiFrontendConfigurations
    _$$_UnifediApiFrontendConfigurationsFromJson(Map<String, dynamic> json) =>
        _$_UnifediApiFrontendConfigurations(
          brandHexColor: json['brand_hex_color'] as String?,
          backgroundImage: json['background_image'] as String?,
        );

Map<String, dynamic> _$$_UnifediApiFrontendConfigurationsToJson(
    _$_UnifediApiFrontendConfigurations instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('brand_hex_color', instance.brandHexColor);
  writeNotNull('background_image', instance.backgroundImage);
  return val;
}
