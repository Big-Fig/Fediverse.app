// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_media_attachment_size_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMediaAttachmentSizeAdapter
    extends TypeAdapter<UnifediApiMediaAttachmentSize> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMediaAttachmentSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMediaAttachmentSize(
      width: fields[0] as int,
      height: fields[1] as int,
      size: fields[2] as String?,
      aspect: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiMediaAttachmentSize obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.width)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.aspect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiMediaAttachmentSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMediaAttachmentSize _$$_UnifediApiMediaAttachmentSizeFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiMediaAttachmentSize(
      width: json['width'] as int,
      height: json['height'] as int,
      size: json['size'] as String?,
      aspect: (json['aspect'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_UnifediApiMediaAttachmentSizeToJson(
    _$_UnifediApiMediaAttachmentSize instance) {
  final val = <String, dynamic>{
    'width': instance.width,
    'height': instance.height,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('size', instance.size);
  writeNotNull('aspect', instance.aspect);
  return val;
}
