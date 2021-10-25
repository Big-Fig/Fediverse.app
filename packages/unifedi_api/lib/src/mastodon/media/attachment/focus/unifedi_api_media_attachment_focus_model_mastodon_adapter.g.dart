// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_media_attachment_focus_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMediaAttachmentFocusMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiMediaAttachmentFocusMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMediaAttachmentFocusMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMediaAttachmentFocusMastodonAdapter(
      fields[0] as MastodonApiMediaAttachmentFocus,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiMediaAttachmentFocusMastodonAdapter obj) {
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
      other is UnifediApiMediaAttachmentFocusMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMediaAttachmentFocusMastodonAdapter
    _$$_UnifediApiMediaAttachmentFocusMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiMediaAttachmentFocusMastodonAdapter(
          MastodonApiMediaAttachmentFocus.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiMediaAttachmentFocusMastodonAdapterToJson(
        _$_UnifediApiMediaAttachmentFocusMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
