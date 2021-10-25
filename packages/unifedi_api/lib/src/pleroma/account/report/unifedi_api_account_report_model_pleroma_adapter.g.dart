// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_report_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountReportPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAccountReportPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountReportPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountReportPleromaAdapter(
      fields[0] as PleromaApiAccountReport,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccountReportPleromaAdapter obj) {
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
      other is UnifediApiAccountReportPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountReportPleromaAdapter
    _$$_UnifediApiAccountReportPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAccountReportPleromaAdapter(
          PleromaApiAccountReport.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiAccountReportPleromaAdapterToJson(
        _$_UnifediApiAccountReportPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
