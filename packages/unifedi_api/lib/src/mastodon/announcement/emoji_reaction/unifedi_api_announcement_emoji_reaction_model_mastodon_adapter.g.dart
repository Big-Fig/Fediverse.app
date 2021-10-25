// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_announcement_emoji_reaction_model_mastodon_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiAnnouncementEmojiReactionMastodonAdapterAdapter
    extends TypeAdapter<UnifediApiAnnouncementEmojiReactionMastodonAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiAnnouncementEmojiReactionMastodonAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiAnnouncementEmojiReactionMastodonAdapter(
      fields[0] as MastodonApiAnnouncementEmojiReaction,
    );
  }

  @override
  void write(BinaryWriter writer,
      UnifediApiAnnouncementEmojiReactionMastodonAdapter obj) {
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
      other is UnifediApiAnnouncementEmojiReactionMastodonAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiAnnouncementEmojiReactionMastodonAdapter
    _$$_UnifediApiAnnouncementEmojiReactionMastodonAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiAnnouncementEmojiReactionMastodonAdapter(
          MastodonApiAnnouncementEmojiReaction.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic>
    _$$_UnifediApiAnnouncementEmojiReactionMastodonAdapterToJson(
            _$_UnifediApiAnnouncementEmojiReactionMastodonAdapter instance) =>
        <String, dynamic>{
          'value': instance.value.toJson(),
        };
