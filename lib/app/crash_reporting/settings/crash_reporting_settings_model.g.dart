// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crash_reporting_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CrashReportingSettingsAdapter
    extends TypeAdapter<CrashReportingSettings> {
  @override
  final int typeId = 70;

  @override
  CrashReportingSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CrashReportingSettings(
      reportingEnabled: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CrashReportingSettings obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.reportingEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrashReportingSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrashReportingSettings _$CrashReportingSettingsFromJson(
    Map<String, dynamic> json) {
  return CrashReportingSettings(
    reportingEnabled: json['reporting_enabled'] as bool,
  );
}

Map<String, dynamic> _$CrashReportingSettingsToJson(
        CrashReportingSettings instance) =>
    <String, dynamic>{
      'reporting_enabled': instance.reportingEnabled,
    };
