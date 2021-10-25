// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_account_report_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAccountReportAdapter
    extends TypeAdapter<UnifediApiAccountReport> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAccountReport read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAccountReport(
      account: fields[0] as UnifediApiAccount?,
      statuses: (fields[1] as List?)?.cast<UnifediApiStatus>(),
      user: fields[2] as UnifediApiAccount?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiAccountReport obj) {
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
      other is UnifediApiAccountReportAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAccountReport _$$_UnifediApiAccountReportFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiAccountReport(
      account: json['account'] == null
          ? null
          : UnifediApiAccount.fromJson(json['account'] as Map<String, dynamic>),
      statuses: (json['statuses'] as List<dynamic>?)
          ?.map((e) => UnifediApiStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : UnifediApiAccount.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiAccountReportToJson(
    _$_UnifediApiAccountReport instance) {
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
