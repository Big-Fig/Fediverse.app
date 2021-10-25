// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_media_attachment_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMediaAttachmentPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiMediaAttachmentPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMediaAttachmentPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMediaAttachmentPleromaAdapter(
      fields[0] as PleromaApiMediaAttachment,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMediaAttachmentPleromaAdapter obj) {
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
      other is UnifediApiMediaAttachmentPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMediaAttachmentPleromaAdapter
    _$$_UnifediApiMediaAttachmentPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiMediaAttachmentPleromaAdapter(
          PleromaApiMediaAttachment.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiMediaAttachmentPleromaAdapterToJson(
        _$_UnifediApiMediaAttachmentPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
