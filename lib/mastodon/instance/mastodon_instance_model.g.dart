// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_instance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonInstanceStatsAdapter extends TypeAdapter<MastodonInstanceStats> {
  @override
  MastodonInstanceStats read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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
}

class MastodonUrlsAdapter extends TypeAdapter<MastodonUrls> {
  @override
  MastodonUrls read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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
