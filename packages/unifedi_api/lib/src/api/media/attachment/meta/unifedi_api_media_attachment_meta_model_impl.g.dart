// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_media_attachment_meta_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMediaAttachmentMetaAdapter
    extends TypeAdapter<UnifediApiMediaAttachmentMeta> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMediaAttachmentMeta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMediaAttachmentMeta(
      focus: fields[0] as UnifediApiMediaAttachmentFocus?,
      original: fields[1] as UnifediApiMediaAttachmentSize?,
      small: fields[2] as UnifediApiMediaAttachmentSize?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMediaAttachmentMeta obj) {
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
      other is UnifediApiMediaAttachmentMetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMediaAttachmentMeta _$$_UnifediApiMediaAttachmentMetaFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiMediaAttachmentMeta(
      focus: json['focus'] == null
          ? null
          : UnifediApiMediaAttachmentFocus.fromJson(
              json['focus'] as Map<String, dynamic>),
      original: json['original'] == null
          ? null
          : UnifediApiMediaAttachmentSize.fromJson(
              json['original'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : UnifediApiMediaAttachmentSize.fromJson(
              json['small'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiMediaAttachmentMetaToJson(
    _$_UnifediApiMediaAttachmentMeta instance) {
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
