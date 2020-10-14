// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentSearchListAdapter extends TypeAdapter<RecentSearchList> {
  @override
  RecentSearchList read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentSearchList(
      recentItems: (fields[0] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecentSearchList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recentItems);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearchList _$RecentSearchListFromJson(Map<String, dynamic> json) {
  return RecentSearchList(
    recentItems:
        (json['recentItems'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RecentSearchListToJson(RecentSearchList instance) =>
    <String, dynamic>{
      'recentItems': instance.recentItems,
    };
