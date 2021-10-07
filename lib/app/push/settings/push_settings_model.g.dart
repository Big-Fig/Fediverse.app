// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PushSettingsAdapter extends TypeAdapter<PushSettings> {
  @override
  final int typeId = 15;

  @override
  PushSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PushSettings(
      favourite: fields[1] as bool?,
      follow: fields[2] as bool?,
      mention: fields[3] as bool?,
      reblog: fields[4] as bool?,
      poll: fields[5] as bool?,
      chatMention: fields[6] as bool?,
      emojiReaction: fields[7] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PushSettings obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.favourite)
      ..writeByte(2)
      ..write(obj.follow)
      ..writeByte(3)
      ..write(obj.mention)
      ..writeByte(4)
      ..write(obj.reblog)
      ..writeByte(5)
      ..write(obj.poll)
      ..writeByte(6)
      ..write(obj.chatMention)
      ..writeByte(7)
      ..write(obj.emojiReaction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PushSettings _$$_PushSettingsFromJson(Map<String, dynamic> json) =>
    _$_PushSettings(
      favourite: json['favourite'] as bool?,
      follow: json['follow'] as bool?,
      mention: json['mention'] as bool?,
      reblog: json['reblog'] as bool?,
      poll: json['poll'] as bool?,
      chatMention: json['chatMention'] as bool?,
      emojiReaction: json['emojiReaction'] as bool?,
    );

Map<String, dynamic> _$$_PushSettingsToJson(_$_PushSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('favourite', instance.favourite);
  writeNotNull('follow', instance.follow);
  writeNotNull('mention', instance.mention);
  writeNotNull('reblog', instance.reblog);
  writeNotNull('poll', instance.poll);
  writeNotNull('chatMention', instance.chatMention);
  writeNotNull('emojiReaction', instance.emojiReaction);
  return val;
}
