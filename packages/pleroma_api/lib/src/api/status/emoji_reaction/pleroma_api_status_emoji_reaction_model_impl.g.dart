// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_status_emoji_reaction_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiStatusEmojiReactionAdapter
    extends TypeAdapter<PleromaApiStatusEmojiReaction> {
  @override
  final int typeId = 0;

  @override
  PleromaApiStatusEmojiReaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiStatusEmojiReaction(
      name: fields[0] as String,
      count: fields[1] as int,
      me: fields[2] as bool,
      accounts: (fields[3] as List?)?.cast<PleromaApiAccount>(),
      url: fields[4] as String?,
      staticUrl: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiStatusEmojiReaction obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.me)
      ..writeByte(3)
      ..write(obj.accounts)
      ..writeByte(5)
      ..write(obj.staticUrl)
      ..writeByte(4)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiStatusEmojiReactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiStatusEmojiReaction _$$_PleromaApiStatusEmojiReactionFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiStatusEmojiReaction(
      name: json['name'] as String,
      count: json['count'] as int,
      me: json['me'] as bool,
      accounts: (json['accounts'] as List<dynamic>?)
          ?.map((e) => PleromaApiAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      url: json['url'] as String?,
      staticUrl: json['staticUrl'] as String?,
    );

Map<String, dynamic> _$$_PleromaApiStatusEmojiReactionToJson(
    _$_PleromaApiStatusEmojiReaction instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'count': instance.count,
    'me': instance.me,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accounts', instance.accounts?.map((e) => e.toJson()).toList());
  writeNotNull('url', instance.url);
  writeNotNull('staticUrl', instance.staticUrl);
  return val;
}
