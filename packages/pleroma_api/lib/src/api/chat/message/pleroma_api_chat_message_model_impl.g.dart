// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pleroma_api_chat_message_model_impl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PleromaApiChatMessageAdapter extends TypeAdapter<PleromaApiChatMessage> {
  @override
  final int typeId = 0;

  @override
  PleromaApiChatMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PleromaApiChatMessage(
      id: fields[0] as String,
      chatId: fields[1] as String,
      accountId: fields[2] as String,
      content: fields[3] as String?,
      createdAt: fields[4] as DateTime,
      emojis: (fields[5] as List?)?.cast<PleromaApiEmoji>(),
      mediaAttachment: fields[6] as PleromaApiMediaAttachment?,
      card: fields[7] as PleromaApiCard?,
    );
  }

  @override
  void write(BinaryWriter writer, PleromaApiChatMessage obj) {
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
      other is PleromaApiChatMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PleromaApiChatMessage _$$_PleromaApiChatMessageFromJson(
        Map<String, dynamic> json) =>
    _$_PleromaApiChatMessage(
      id: json['id'] as String,
      chatId: json['chat_id'] as String,
      accountId: json['account_id'] as String,
      content: json['content'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      emojis: (json['emojis'] as List<dynamic>?)
          ?.map((e) => PleromaApiEmoji.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaAttachment: json['attachment'] == null
          ? null
          : PleromaApiMediaAttachment.fromJson(
              json['attachment'] as Map<String, dynamic>),
      card: json['card'] == null
          ? null
          : PleromaApiCard.fromJson(json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PleromaApiChatMessageToJson(
    _$_PleromaApiChatMessage instance) {
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
