// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_media_attachment_meta_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiMediaAttachmentMetaAdapter
    extends TypeAdapter<MastodonApiMediaAttachmentMeta> {
  @override
  final int typeId = 0;

  @override
  MastodonApiMediaAttachmentMeta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiMediaAttachmentMeta(
      focus: fields[0] as MastodonApiMediaAttachmentFocus?,
      original: fields[1] as MastodonApiMediaAttachmentSize?,
      small: fields[2] as MastodonApiMediaAttachmentSize?,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiMediaAttachmentMeta obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.focus)
      ..writeByte(1)
      ..write(obj.original)
      ..writeByte(2)
      ..write(obj.small);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MastodonApiMediaAttachmentMetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiMediaAttachmentMeta _$$_MastodonApiMediaAttachmentMetaFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiMediaAttachmentMeta(
      focus: json['focus'] == null
          ? null
          : MastodonApiMediaAttachmentFocus.fromJson(
              json['focus'] as Map<String, dynamic>),
      original: json['original'] == null
          ? null
          : MastodonApiMediaAttachmentSize.fromJson(
              json['original'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : MastodonApiMediaAttachmentSize.fromJson(
              json['small'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MastodonApiMediaAttachmentMetaToJson(
    _$_MastodonApiMediaAttachmentMeta instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('focus', instance.focus?.toJson());
  writeNotNull('original', instance.original?.toJson());
  writeNotNull('small', instance.small?.toJson());
  return val;
}
