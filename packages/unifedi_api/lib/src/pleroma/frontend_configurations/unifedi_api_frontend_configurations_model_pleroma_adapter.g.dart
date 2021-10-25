// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_frontend_configurations_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiFrontendConfigurationsPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiFrontendConfigurationsPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiFrontendConfigurationsPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiFrontendConfigurationsPleromaAdapter(
      fields[0] as PleromaApiFrontendConfigurations,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiFrontendConfigurationsPleromaAdapter obj) {
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
      other is UnifediApiFrontendConfigurationsPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiFrontendConfigurationsPleromaAdapter
    _$$_UnifediApiFrontendConfigurationsPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiFrontendConfigurationsPleromaAdapter(
          PleromaApiFrontendConfigurations.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiFrontendConfigurationsPleromaAdapterToJson(
        _$_UnifediApiFrontendConfigurationsPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
