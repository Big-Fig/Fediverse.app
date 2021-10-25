// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_urls_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceUrlsAdapter
    extends TypeAdapter<UnifediApiInstanceUrls> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceUrls read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceUrls(
      streamingApi: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceUrls obj) {
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
      other is UnifediApiInstanceUrlsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceUrls _$$_UnifediApiInstanceUrlsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstanceUrls(
      streamingApi: json['streaming_api'] as String?,
    );

Map<String, dynamic> _$$_UnifediApiInstanceUrlsToJson(
    _$_UnifediApiInstanceUrls instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('streaming_api', instance.streamingApi);
  return val;
}
