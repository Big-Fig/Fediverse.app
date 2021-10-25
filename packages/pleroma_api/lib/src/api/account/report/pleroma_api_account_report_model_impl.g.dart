// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_account_report_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiAccountReportAdapter
    extends TypeAdapter<PleromaApiAccountReport> {
  @override
  final int typeId = 0;

  @override
  PleromaApiAccountReport read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiAccountReport(
      account: fields[0] as PleromaApiAccount?,
      statuses: (fields[1] as List?)?.cast<PleromaApiStatus>(),
      user: fields[2] as PleromaApiAccount?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiAccountReport obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.statuses)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(2)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiAccountReportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiAccountReport _$$_PleromaApiAccountReportFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiAccountReport(
      account: json['account'] == null
          ? null
          : PleromaApiAccount.fromJson(json['account'] as Map<String, dynamic>),
      statuses: (json['statuses'] as List<dynamic>?)
          ?.map((e) => PleromaApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : PleromaApiAccount.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiAccountReportToJson(
    _$_PleromaApiAccountReport instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('account', instance.account?.toJson());
  writeNotNull('statuses', instance.statuses?.map((e) => e.toJson()).toList());
  writeNotNull('user', instance.user?.toJson());
  return val;
}
