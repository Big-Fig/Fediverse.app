// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_status_emoji_reaction_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiStatusEmojiReactionPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiStatusEmojiReactionPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiStatusEmojiReactionPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiStatusEmojiReactionPleromaAdapter(
      fields[0] as PleromaApiStatusEmojiReaction,
    );
  }

  @override
  void write(
      BinaryWriter writer, UnifediApiStatusEmojiReactionPleromaAdapter obj) {
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
      other is UnifediApiStatusEmojiReactionPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiStatusEmojiReactionPleromaAdapter
    _$$_UnifediApiStatusEmojiReactionPleromaAdapterFromJson(
            Map<String, dynamic> json) =>
        _$_UnifediApiStatusEmojiReactionPleromaAdapter(
          PleromaApiStatusEmojiReaction.fromJson(
              json['value'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_UnifediApiStatusEmojiReactionPleromaAdapterToJson(
        _$_UnifediApiStatusEmojiReactionPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
