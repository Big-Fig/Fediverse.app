// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_instance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonInstanceStatsAdapter extends TypeAdapter<MastodonInstanceStats> {
  @override
  final int typeId = 29;

  @override
  MastodonInstanceStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonInstanceStats(
      userCount: fields[0] as int,
      statusCount: fields[1] as int,
      domainCount: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonInstanceStats obj) {
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
      other is MastodonInstanceStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MastodonUrlsAdapter extends TypeAdapter<MastodonUrls> {
  @override
  final int typeId = 30;

  @override
  MastodonUrls read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonUrls(
      streamingApi: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonUrls obj) {
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
      other is MastodonUrlsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MastodonInstanceStats _$MastodonInstanceStatsFromJson(
    Map<String, dynamic> json) {
  return MastodonInstanceStats(
    userCount: json['user_count'] as int,
    statusCount: json['status_count'] as int,
    domainCount: json['domain_count'] as int,
  );
}

Map<String, dynamic> _$MastodonInstanceStatsToJson(
        MastodonInstanceStats instance) =>
    <String, dynamic>{
      'user_count': instance.userCount,
      'status_count': instance.statusCount,
      'domain_count': instance.domainCount,
    };

MastodonUrls _$MastodonUrlsFromJson(Map<String, dynamic> json) {
  return MastodonUrls(
    streamingApi: json['streaming_api'] as String,
  );
}

Map<String, dynamic> _$MastodonUrlsToJson(MastodonUrls instance) =>
    <String, dynamic>{
      'streaming_api': instance.streamingApi,
    };
