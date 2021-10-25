// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_media_attachment_meta_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiMediaAttachmentMetaAdapter
    extends TypeAdapter<PleromaApiMediaAttachmentMeta> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMediaAttachmentMeta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMediaAttachmentMeta(
      focus: fields[0] as PleromaApiMediaAttachmentFocus?,
      original: fields[1] as PleromaApiMediaAttachmentSize?,
      small: fields[2] as PleromaApiMediaAttachmentSize?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMediaAttachmentMeta obj) {
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
      other is PleromaApiMediaAttachmentMetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiMediaAttachmentMeta _$$_PleromaApiMediaAttachmentMetaFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiMediaAttachmentMeta(
      focus: json['focus'] == null
          ? null
          : PleromaApiMediaAttachmentFocus.fromJson(
              json['focus'] as Map<String, dynamic>),
      original: json['original'] == null
          ? null
          : PleromaApiMediaAttachmentSize.fromJson(
              json['original'] as Map<String, dynamic>),
      small: json['small'] == null
          ? null
          : PleromaApiMediaAttachmentSize.fromJson(
              json['small'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiMediaAttachmentMetaToJson(
    _$_PleromaApiMediaAttachmentMeta instance) {
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
