// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_media_attachment_meta_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiMediaAttachmentMetaMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiMediaAttachmentMetaMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiMediaAttachmentMetaMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiMediaAttachmentMetaMastodonAdapter(
      fields[0] as MastodonApiMediaAttachmentMeta,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiMediaAttachmentMetaMastodonAdapter obj) {
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
      other is UnifediApiMediaAttachmentMetaMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiMediaAttachmentMetaMastodonAdapter
    _$$_UnifediApiMediaAttachmentMetaMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiMediaAttachmentMetaMastodonAdapter(
          MastodonApiMediaAttachmentMeta.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiMediaAttachmentMetaMastodonAdapterToJson(
        _$_UnifediApiMediaAttachmentMetaMastodonAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
