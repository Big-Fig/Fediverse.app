// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_instance_urls_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiInstanceUrlsAdapter
    extends TypeAdapter<MastodonApiInstanceUrls> {
  @override
  final int typeId = 0;

  @override
  MastodonApiInstanceUrls read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiInstanceUrls(
      streamingApi: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiInstanceUrls obj) {
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
      other is MastodonApiInstanceUrlsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiInstanceUrls _$$_MastodonApiInstanceUrlsFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiInstanceUrls(
      streamingApi: json['streaming_api'] as String?,
    );

Map<String, dynamic> _$$_MastodonApiInstanceUrlsToJson(
    _$_MastodonApiInstanceUrls instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('streaming_api', instance.streamingApi);
  return val;
}
