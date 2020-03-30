// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaHistoryAdapter extends TypeAdapter<PleromaHistory> {
  @override
  PleromaHistory read(BinaryReader reader) {
    var obj = PleromaHistory();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.accounts = reader.read() as int;
          break;
        case 1:
          obj.dayInUnixTimestamp = reader.read() as int;
          break;
        case 2:
          obj.uses = reader.read() as int;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, PleromaHistory obj) {
    writer.writeByte(3);
    writer.writeByte(0);
    writer.write(obj.accounts);
    writer.writeByte(1);
    writer.write(obj.dayInUnixTimestamp);
    writer.writeByte(2);
    writer.write(obj.uses);
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
