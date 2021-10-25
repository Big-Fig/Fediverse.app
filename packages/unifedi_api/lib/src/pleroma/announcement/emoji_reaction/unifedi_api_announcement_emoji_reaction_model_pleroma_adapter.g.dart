// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_announcement_emoji_reaction_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAnnouncementEmojiReactionPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiAnnouncementEmojiReactionPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAnnouncementEmojiReactionPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAnnouncementEmojiReactionPleromaAdapter(
      fields[0] as PleromaApiAnnouncementEmojiReaction,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiAnnouncementEmojiReactionPleromaAdapter obj) {
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
      other is UnifediApiAnnouncementEmojiReactionPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAnnouncementEmojiReactionPleromaAdapter
    _$$_UnifediApiAnnouncementEmojiReactionPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAnnouncementEmojiReactionPleromaAdapter(
          PleromaApiAnnouncementEmojiReaction.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$_UnifediApiAnnouncementEmojiReactionPleromaAdapterToJson(
            _$_UnifediApiAnnouncementEmojiReactionPleromaAdapter instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
        };
