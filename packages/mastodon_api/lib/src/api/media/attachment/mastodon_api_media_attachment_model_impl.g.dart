// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_media_attachment_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiMediaAttachmentAdapter
    extends TypeAdapter<MastodonApiMediaAttachment> {
  @override
  final int typeId = 0;

  @override
  MastodonApiMediaAttachment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiMediaAttachment(
      description: fields[0] as String?,
      id: fields[1] as String,
      previewUrl: fields[2] as String?,
      remoteUrl: fields[3] as String?,
      textUrl: fields[5] as String?,
      type: fields[6] as String,
      url: fields[7] as String?,
      blurhash: fields[8] as String?,
      meta: fields[9] as MastodonApiMediaAttachmentMeta?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiMediaAttachment obj) {
    writer
      ..writeByte(9)
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
      ..write(obj.blurhash)
      ..writeByte(9)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiMediaAttachmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiMediaAttachment _$$_MastodonApiMediaAttachmentFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiMediaAttachment(
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
          : MastodonApiMediaAttachmentMeta.fromJson(
              json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MastodonApiMediaAttachmentToJson(
    _$_MastodonApiMediaAttachment instance) {
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
  return val;
}
