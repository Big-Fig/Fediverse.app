// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaHistoryAdapter extends TypeAdapter<PleromaHistory> {
  @override
  final int typeId = 45;

  @override
  PleromaHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
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
