// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_media_attachment_focus_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMediaAttachmentFocusPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiMediaAttachmentFocusPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMediaAttachmentFocusPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMediaAttachmentFocusPleromaAdapter(
      fields[0] as PleromaApiMediaAttachmentFocus,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiMediaAttachmentFocusPleromaAdapter obj) {
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
      other is UnifediApiMediaAttachmentFocusPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMediaAttachmentFocusPleromaAdapter
    _$$_UnifediApiMediaAttachmentFocusPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiMediaAttachmentFocusPleromaAdapter(
          PleromaApiMediaAttachmentFocus.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiMediaAttachmentFocusPleromaAdapterToJson(
        _$_UnifediApiMediaAttachmentFocusPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
