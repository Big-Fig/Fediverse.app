// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_emoji_model_pleroma_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiEmojiPleromaAdapterAdapter
    extends TypeAdapter<UnifediApiEmojiPleromaAdapter> {
  @override
  final int typeId = 0;

  @override
  UnifediApiEmojiPleromaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiEmojiPleromaAdapter(
      fields[0] as PleromaApiEmoji,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiEmojiPleromaAdapter obj) {
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
      other is UnifediApiEmojiPleromaAdapterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiEmojiPleromaAdapter _$$_UnifediApiEmojiPleromaAdapterFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiEmojiPleromaAdapter(
      PleromaApiEmoji.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiEmojiPleromaAdapterToJson(
        _$_UnifediApiEmojiPleromaAdapter instance) =>
    <String, dynamic>{
      'value': instance.value.toJson(),
    };
