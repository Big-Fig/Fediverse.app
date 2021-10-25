// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unifedi_api_chat_message_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnifediApiChatMessageAdapter extends TypeAdapter<UnifediApiChatMessage> {
  @override
  final int typeId = 0;

  @override
  UnifediApiChatMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnifediApiChatMessage(
      id: fields[0] as String,
      chatId: fields[1] as String,
      accountId: fields[2] as String,
      content: fields[3] as String?,
      createdAt: fields[4] as DateTime,
      emojis: (fields[5] as List?)?.cast<UnifediApiEmoji>(),
      mediaAttachment: fields[6] as UnifediApiMediaAttachment?,
      card: fields[7] as UnifediApiCard?,
    );
  }

  @override
  void write(BinaryWriter writer, UnifediApiChatMessage obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chatId)
      ..writeByte(2)
      ..write(obj.accountId)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.emojis)
      ..writeByte(6)
      ..write(obj.mediaAttachment)
      ..writeByte(7)
      ..write(obj.card);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiChatMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnifediApiChatMessage _$$_UnifediApiChatMessageFromJson(
        Map<String, dynamic> json) =>
    _$_UnifediApiChatMessage(
      id: json['id'] as String,
      chatId: json['chat_id'] as String,
      accountId: json['account_id'] as String,
      content: json['content'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      emojis: (json['emojis'] as List<dynamic>?)
          ?.map((e) => UnifediApiEmoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaAttachment: json['attachment'] == null
          ? null
          : UnifediApiMediaAttachment.fromJson(
              json['attachment'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : UnifediApiCard.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UnifediApiChatMessageToJson(
    _$_UnifediApiChatMessage instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'chat_id': instance.chatId,
    'account_id': instance.accountId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  val['created_at'] = instance.createdAt.toIso8601String();
  writeNotNull('emojis', instance.emojis?.map((e) => e.toJson()).toList());
  writeNotNull('attachment', instance.mediaAttachment?.toJson());
  writeNotNull('card', instance.card?.toJson());
  return val;
}
