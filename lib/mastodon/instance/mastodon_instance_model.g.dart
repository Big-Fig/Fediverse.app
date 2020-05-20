// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_instance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonInstanceStatsAdapter extends TypeAdapter<MastodonInstanceStats> {
  @override
  MastodonInstanceStats read(BinaryReader reader) {
    var obj = MastodonInstanceStats();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.userCount = reader.read() as int;
          break;
        case 1:
          obj.statusCount = reader.read() as int;
          break;
        case 2:
          obj.domainCount = reader.read() as int;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, MastodonInstanceStats obj) {
    writer.writeByte(3);
    writer.writeByte(0);
    writer.write(obj.userCount);
    writer.writeByte(1);
    writer.write(obj.statusCount);
    writer.writeByte(2);
    writer.write(obj.domainCount);
  }
}

class MastodonUrlsAdapter extends TypeAdapter<MastodonUrls> {
  @override
  MastodonUrls read(BinaryReader reader) {
    var obj = MastodonUrls();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 0:
          obj.streamingApi = reader.read() as String;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, MastodonUrls obj) {
    writer.writeByte(1);
    writer.writeByte(0);
    writer.write(obj.streamingApi);
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
