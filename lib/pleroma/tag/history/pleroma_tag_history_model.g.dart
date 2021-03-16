// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_tag_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaTagHistoryAdapter extends TypeAdapter<PleromaTagHistory> {
  @override
  final int typeId = 45;

  @override
  PleromaTagHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaTagHistory(
      accounts: fields[0] as dynamic,
      dayInUnixTimestamp: fields[1] as int?,
      uses: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaTagHistory obj) {
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
      other is PleromaTagHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaTagHistory _$PleromaTagHistoryFromJson(Map<String, dynamic> json) {
  return PleromaTagHistory(
    accounts: json['accounts'],
    dayInUnixTimestamp: json['dayInUnixTimestamp'] as int?,
    uses: json['uses'],
  );
}

Map<String, dynamic> _$PleromaTagHistoryToJson(PleromaTagHistory instance) =>
    <String, dynamic>{
      'accounts': instance.accounts,
      'dayInUnixTimestamp': instance.dayInUnixTimestamp,
      'uses': instance.uses,
    };
