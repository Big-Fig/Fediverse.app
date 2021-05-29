// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_tag_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiTagHistoryAdapter extends TypeAdapter<PleromaApiTagHistory> {
  @override
  final int typeId = 45;

  @override
  PleromaApiTagHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiTagHistory(
      accounts: fields[0] as int,
      dayInUnixTimestamp: fields[1] as int?,
      uses: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiTagHistory obj) {
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
      other is PleromaApiTagHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PleromaApiTagHistory _$PleromaApiTagHistoryFromJson(Map<String, dynamic> json) {
  return PleromaApiTagHistory(
    accounts: int.parse(json['accounts'] as String),
    dayInUnixTimestamp: json['dayInUnixTimestamp'] as int?,
    uses: int.parse(json['uses'] as String),
  );
}

Map<String, dynamic> _$PleromaApiTagHistoryToJson(
        PleromaApiTagHistory instance) =>
    <String, dynamic>{
      'accounts': PleromaApiTagHistory._intToString(instance.accounts),
      'dayInUnixTimestamp': instance.dayInUnixTimestamp,
      'uses': PleromaApiTagHistory._intToString(instance.uses),
    };
