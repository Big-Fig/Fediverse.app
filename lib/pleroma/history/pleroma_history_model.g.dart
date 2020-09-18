// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaHistoryAdapter extends TypeAdapter<PleromaHistory> {
  @override
  PleromaHistory read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaHistory(
      accounts: fields[0] as int,
      dayInUnixTimestamp: fields[1] as int,
      uses: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.accounts)
      ..writeByte(1)
      ..write(obj.dayInUnixTimestamp)
      ..writeByte(2)
      ..write(obj.uses);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaHistory _$PleromaHistoryFromJson(Map<String, dynamic> json) {
  return PleromaHistory(
    accounts: json['accounts'] as int,
    dayInUnixTimestamp: json['dayInUnixTimestamp'] as int,
    uses: json['uses'] as int,
  );
}

Map<String, dynamic> _$PleromaHistoryToJson(PleromaHistory instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
      'dayInUnixTimestamp': instance.dayInUnixTimestamp,
      'uses': instance.uses,
    };
