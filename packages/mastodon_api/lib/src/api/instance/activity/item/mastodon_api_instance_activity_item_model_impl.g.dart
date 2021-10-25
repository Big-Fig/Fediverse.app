// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_instance_activity_item_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiInstanceActivityItemAdapter
    extends TypeAdapter<MastodonApiInstanceActivityItem> {
  @override
  final int typeId = 0;

  @override
  MastodonApiInstanceActivityItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiInstanceActivityItem(
      week: fields[0] as int,
      statuses: fields[1] as int,
      logins: fields[2] as int,
      registrations: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiInstanceActivityItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.week)
      ..writeByte(1)
      ..write(obj.statuses)
      ..writeByte(2)
      ..write(obj.logins)
      ..writeByte(3)
      ..write(obj.registrations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiInstanceActivityItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiInstanceActivityItem _$$_MastodonApiInstanceActivityItemFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiInstanceActivityItem(
      week: JsonParseHelper.fromStringToInt(json['week'] as String),
      statuses: JsonParseHelper.fromStringToInt(json['statuses'] as String),
      logins: JsonParseHelper.fromStringToInt(json['logins'] as String),
      registrations:
          JsonParseHelper.fromStringToInt(json['registrations'] as String),
    );

Map<String, dynamic> _$$_MastodonApiInstanceActivityItemToJson(
    _$_MastodonApiInstanceActivityItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('week', JsonParseHelper.toStringFromInt(instance.week));
  writeNotNull('statuses', JsonParseHelper.toStringFromInt(instance.statuses));
  writeNotNull('logins', JsonParseHelper.toStringFromInt(instance.logins));
  writeNotNull(
      'registrations', JsonParseHelper.toStringFromInt(instance.registrations));
  return val;
}
