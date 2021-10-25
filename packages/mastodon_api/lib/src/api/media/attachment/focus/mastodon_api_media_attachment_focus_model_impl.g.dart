// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastodon_api_media_attachment_focus_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MastodonApiMediaAttachmentFocusAdapter
    extends TypeAdapter<MastodonApiMediaAttachmentFocus> {
  @override
  final int typeId = 0;

  @override
  MastodonApiMediaAttachmentFocus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MastodonApiMediaAttachmentFocus(
      x: fields[0] as double,
      y: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, MastodonApiMediaAttachmentFocus obj) {
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
      other is MastodonApiMediaAttachmentFocusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MastodonApiMediaAttachmentFocus _$$_MastodonApiMediaAttachmentFocusFromJson(
        Map<String, dynamic> json) =>
    _$_MastodonApiMediaAttachmentFocus(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$$_MastodonApiMediaAttachmentFocusToJson(
        _$_MastodonApiMediaAttachmentFocus instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
