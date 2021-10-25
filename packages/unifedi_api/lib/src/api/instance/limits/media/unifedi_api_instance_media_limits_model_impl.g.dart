// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_instance_media_limits_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiInstanceMediaLimitsAdapter
    extends TypeAdapter<UnifediApiInstanceMediaLimits> {
  @override
  final int typeId = 0;

  @override
  UnifediApiInstanceMediaLimits read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiInstanceMediaLimits(
      uploadLimit: fields[0] as int?,
      avatarUploadLimit: fields[1] as int?,
      backgroundUploadLimit: fields[2] as int?,
      bannerUploadLimit: fields[3] as int?,
      descriptionLimit: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiInstanceMediaLimits obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.uploadLimit)
      ..writeByte(1)
      ..write(obj.avatarUploadLimit)
      ..writeByte(2)
      ..write(obj.backgroundUploadLimit)
      ..writeByte(3)
      ..write(obj.bannerUploadLimit)
      ..writeByte(4)
      ..write(obj.descriptionLimit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiInstanceMediaLimitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiInstanceMediaLimits _$$_UnifediApiInstanceMediaLimitsFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiInstanceMediaLimits(
      uploadLimit: json['upload_limit'] as int?,
      avatarUploadLimit: json['avatar_upload_limit'] as int?,
      backgroundUploadLimit: json['background_upload_limit'] as int?,
      bannerUploadLimit: json['banner_upload_limit'] as int?,
      descriptionLimit: json['description_limit'] as int?,
    );

Map<String, dynamic> _$$_UnifediApiInstanceMediaLimitsToJson(
    _$_UnifediApiInstanceMediaLimits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('upload_limit', instance.uploadLimit);
  writeNotNull('avatar_upload_limit', instance.avatarUploadLimit);
  writeNotNull('background_upload_limit', instance.backgroundUploadLimit);
  writeNotNull('banner_upload_limit', instance.bannerUploadLimit);
  writeNotNull('description_limit', instance.descriptionLimit);
  return val;
}
