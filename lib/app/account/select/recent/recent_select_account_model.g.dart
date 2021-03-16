// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_select_account_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentSelectAccountListAdapter
    extends TypeAdapter<RecentSelectAccountList> {
  @override
  final int typeId = 61;

  @override
  RecentSelectAccountList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentSelectAccountList(
      recentItems: (fields[0] as List?)?.cast<PleromaAccount>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecentSelectAccountList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.recentItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentSelectAccountListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSelectAccountList _$RecentSelectAccountListFromJson(
    Map<String, dynamic> json) {
  return RecentSelectAccountList(
    recentItems: (json['recentItems'] as List<dynamic>?)
        ?.map((e) => PleromaAccount.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RecentSelectAccountListToJson(
        RecentSelectAccountList instance) =>
    <String, dynamic>{
      'recentItems': instance.recentItems?.map((e) => e.toJson()).toList(),
    };
