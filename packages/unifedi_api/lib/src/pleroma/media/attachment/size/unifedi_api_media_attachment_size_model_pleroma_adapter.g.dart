// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_media_attachment_size_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMediaAttachmentSizePleromaAdapterAdapter
    extends TypeAdapter<UnifediApiMediaAttachmentSizePleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMediaAttachmentSizePleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMediaAttachmentSizePleromaAdapter(
      fields[0] as PleromaApiMediaAttachmentSize,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiMediaAttachmentSizePleromaAdapter obj) {
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
      other is UnifediApiMediaAttachmentSizePleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMediaAttachmentSizePleromaAdapter
    _$$_UnifediApiMediaAttachmentSizePleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiMediaAttachmentSizePleromaAdapter(
          PleromaApiMediaAttachmentSize.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiMediaAttachmentSizePleromaAdapterToJson(
        _$_UnifediApiMediaAttachmentSizePleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
