// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_media_attachment_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiMediaAttachmentAdapter
    extends TypeAdapter<PleromaApiMediaAttachment> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMediaAttachment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMediaAttachment(
      description: fields[0] as String?,
      id: fields[1] as String,
      previewUrl: fields[2] as String?,
      remoteUrl: fields[3] as String?,
      textUrl: fields[5] as String?,
      type: fields[6] as String,
      url: fields[7] as String?,
      blurhash: fields[8] as String?,
      meta: fields[9] as PleromaApiMediaAttachmentMeta?,
      pleroma: fields[10] as PleromaApiMediaAttachmentPleromaPart?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMediaAttachment obj) {
    writer
      ..writeByte(10)
      ..writeByte(9)
      ..write(obj.meta)
      ..writeByte(10)
      ..write(obj.pleroma)
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
      ..writeByte(8)
      ..write(obj.blurhash);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMediaAttachmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PleromaApiMediaAttachmentPleromaPartAdapter
    extends TypeAdapter<PleromaApiMediaAttachmentPleromaPart> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMediaAttachmentPleromaPart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMediaAttachmentPleromaPart(
      mimeType: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMediaAttachmentPleromaPart obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.mimeType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMediaAttachmentPleromaPartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiMediaAttachment _$$_PleromaApiMediaAttachmentFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiMediaAttachment(
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
          : PleromaApiMediaAttachmentMeta.fromJson(
              json['meta'] as Map<String, dynamic>),
      pleroma: json['pleroma'] == null
          ? null
          : PleromaApiMediaAttachmentPleromaPart.fromJson(
              json['pleroma'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiMediaAttachmentToJson(
    _$_PleromaApiMediaAttachment instance) {
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
  writeNotNull('pleroma', instance.pleroma?.toJson());
  return val;
}

_$_PleromaApiMediaAttachmentPleromaPart
    _$$_PleromaApiMediaAttachmentPleromaPartFromJson(
            Map<String, dynamic> json) =>
        _$_PleromaApiMediaAttachmentPleromaPart(
          mimeType: json['mime_type'] as String?,
        );

Map<String, dynamic> _$$_PleromaApiMediaAttachmentPleromaPartToJson(
    _$_PleromaApiMediaAttachmentPleromaPart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mime_type', instance.mimeType);
  return val;
}
