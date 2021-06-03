// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_instance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiInstanceStatsAdapter
    extends TypeAdapter<MastodonApiInstanceStats> {
  @override
  final int typeId = 29;

  @override
  MastodonApiInstanceStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiInstanceStats(
      userCount: fields[0] as int?,
      statusCount: fields[1] as int?,
      domainCount: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiInstanceStats obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userCount)
      ..writeByte(1)
      ..write(obj.statusCount)
      ..writeByte(2)
      ..write(obj.domainCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiInstanceStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MastodonApiUrlsAdapter extends TypeAdapter<MastodonApiUrls> {
  @override
  final int typeId = 30;

  @override
  MastodonApiUrls read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiUrls(
      streamingApi: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiUrls obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.streamingApi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiUrlsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonApiInstanceStats _$MastodonApiInstanceStatsFromJson(
    Map<String, dynamic> json) {
  return MastodonApiInstanceStats(
    userCount: json['user_count'] as int?,
    statusCount: json['status_count'] as int?,
    domainCount: json['domain_count'] as int?,
  );
}

Map<String, dynamic> _$MastodonApiInstanceStatsToJson(
        MastodonApiInstanceStats instance) =>
    <String, dynamic>{
      'user_count': instance.userCount,
      'status_count': instance.statusCount,
      'domain_count': instance.domainCount,
    };

MastodonApiUrls _$MastodonApiUrlsFromJson(Map<String, dynamic> json) {
  return MastodonApiUrls(
    streamingApi: json['streaming_api'] as String?,
  );
}

Map<String, dynamic> _$MastodonApiUrlsToJson(MastodonApiUrls instance) =>
    <String, dynamic>{
      'streaming_api': instance.streamingApi,
    };
