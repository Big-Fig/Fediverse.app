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
      recentItems: (fields[0] as List?)?.cast<UnifediApiAccount>(),
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

_$_RecentSelectAccountList _$$_RecentSelectAccountListFromJson(
        Map<String, dynamic> json) =>
    _$_RecentSelectAccountList(
      recentItems: (json['recentItems'] as List<dynamic>?)
          ?.map((e) => UnifediApiAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecentSelectAccountListToJson(
    _$_RecentSelectAccountList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'recentItems', instance.recentItems?.map((e) => e.toJson()).toList());
  return val;
}
