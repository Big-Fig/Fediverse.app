// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_status_limits_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceStatusLimitsAdapter
    extends TypeAdapter<UnifediApiInstanceStatusLimits> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceStatusLimits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceStatusLimits(
      maxTootChars: fields[0] as int?,
      maxMediaAttachmentsCount: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceStatusLimits obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.maxTootChars)
      ..writeByte(1)
      ..write(obj.maxMediaAttachmentsCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiInstanceStatusLimitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceStatusLimits _$$_UnifediApiInstanceStatusLimitsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstanceStatusLimits(
      maxTootChars: json['max_toot_chars'] as int?,
      maxMediaAttachmentsCount: json['max_media_attachments_count'] as int?,
    );

Map<String, dynamic> _$$_UnifediApiInstanceStatusLimitsToJson(
    _$_UnifediApiInstanceStatusLimits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('max_toot_chars', instance.maxTootChars);
  writeNotNull(
      'max_media_attachments_count', instance.maxMediaAttachmentsCount);
  return val;
}
