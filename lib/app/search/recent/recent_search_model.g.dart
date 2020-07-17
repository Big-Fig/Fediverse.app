// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentSearchListAdapter extends TypeAdapter<RecentSearchList> {
  @override
  RecentSearchList read(BinaryReader reader) {
    var obj = RecentSearchList();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.recentItems = (reader.read() as List)?.cast<String>();
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, RecentSearchList obj) {
    writer.writeByte(1);
    writer.writeByte(0);
    writer.write(obj.recentItems);
  }
}
