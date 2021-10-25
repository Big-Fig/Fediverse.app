// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_media_attachment_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMediaAttachmentAdapter
    extends TypeAdapter<UnifediApiMediaAttachment> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMediaAttachment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMediaAttachment(
      description: fields[0] as String?,
      id: fields[1] as String,
      previewUrl: fields[2] as String?,
      remoteUrl: fields[3] as String?,
      textUrl: fields[5] as String?,
      type: fields[6] as String,
      url: fields[7] as String?,
      blurhash: fields[8] as String?,
      meta: fields[9] as UnifediApiMediaAttachmentMeta?,
      mimeType: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMediaAttachment obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.previewUrl)
      ..writeByte(3)
      ..write(obj.remoteUrl)
      ..writeByte(5)
      ..write(obj.textUrl)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.url)
      ..writeByte(10)
      ..write(obj.mimeType)
      ..writeByte(8)
      ..write(obj.blurhash)
      ..writeByte(9)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiMediaAttachmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMediaAttachment _$$_UnifediApiMediaAttachmentFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiMediaAttachment(
      description: json['description'] as String?,
      id: json['id'] as String,
      previewUrl: json['preview_url'] as String?,
      remoteUrl: json['remote_url'] as String?,
      textUrl: json['text_url'] as String?,
      type: json['type'] as String,
      url: json['url'] as String?,
      blurhash: json['blurhash'] as String?,
      meta: json['meta'] == null
          ? null
          : UnifediApiMediaAttachmentMeta.fromJson(
              json['meta'] as Map<String, dynamic>),
      mimeType: json['mime_type'] as String?,
    );

Map<String, dynamic> _$$_UnifediApiMediaAttachmentToJson(
    _$_UnifediApiMediaAttachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['id'] = instance.id;
  writeNotNull('preview_url', instance.previewUrl);
  writeNotNull('remote_url', instance.remoteUrl);
  writeNotNull('text_url', instance.textUrl);
  val['type'] = instance.type;
  writeNotNull('url', instance.url);
  writeNotNull('blurhash', instance.blurhash);
  writeNotNull('meta', instance.meta?.toJson());
  writeNotNull('mime_type', instance.mimeType);
  return val;
}
