// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_media_attachment_focus_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiMediaAttachmentFocusAdapter
    extends TypeAdapter<PleromaApiMediaAttachmentFocus> {
  @override
  final int typeId = 0;

  @override
  PleromaApiMediaAttachmentFocus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiMediaAttachmentFocus(
      x: fields[0] as double,
      y: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiMediaAttachmentFocus obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMediaAttachmentFocusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiMediaAttachmentFocus _$$_PleromaApiMediaAttachmentFocusFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiMediaAttachmentFocus(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PleromaApiMediaAttachmentFocusToJson(
        _$_PleromaApiMediaAttachmentFocus instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
