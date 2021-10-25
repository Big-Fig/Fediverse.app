// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_instance_urls_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiInstanceUrlsAdapter
    extends TypeAdapter<PleromaApiInstanceUrls> {
  @override
  final int typeId = 0;

  @override
  PleromaApiInstanceUrls read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiInstanceUrls(
      streamingApi: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiInstanceUrls obj) {
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
      other is PleromaApiInstanceUrlsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiInstanceUrls _$$_PleromaApiInstanceUrlsFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiInstanceUrls(
      streamingApi: json['streaming_api'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiInstanceUrlsToJson(
    _$_PleromaApiInstanceUrls instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('streaming_api', instance.streamingApi);
  return val;
}
