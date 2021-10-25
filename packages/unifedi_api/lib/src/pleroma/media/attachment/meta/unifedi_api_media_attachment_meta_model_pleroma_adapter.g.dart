// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_media_attachment_meta_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMediaAttachmentMetaPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiMediaAttachmentMetaPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMediaAttachmentMetaPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMediaAttachmentMetaPleromaAdapter(
      fields[0] as PleromaApiMediaAttachmentMeta,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiMediaAttachmentMetaPleromaAdapter obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiMediaAttachmentMetaPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMediaAttachmentMetaPleromaAdapter
    _$$_UnifediApiMediaAttachmentMetaPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiMediaAttachmentMetaPleromaAdapter(
          PleromaApiMediaAttachmentMeta.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiMediaAttachmentMetaPleromaAdapterToJson(
        _$_UnifediApiMediaAttachmentMetaPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
