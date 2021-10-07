// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatSettingsAdapter extends TypeAdapter<ChatSettings> {
  @override
  final int typeId = 60;

  @override
  ChatSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatSettings(
      replaceConversationsWithPleromaChats: fields[0] as bool,
      countConversationsInChatsUnreadBadges: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ChatSettings obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.replaceConversationsWithPleromaChats)
      ..writeByte(1)
      ..write(obj.countConversationsInChatsUnreadBadges);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatSettings _$$_ChatSettingsFromJson(Map<String, dynamic> json) =>
    _$_ChatSettings(
      replaceConversationsWithPleromaChats:
          json['replace_conversations_with_pleroma_chats'] as bool,
      countConversationsInChatsUnreadBadges:
          json['count_conversations_in_chats_unread_badges'] as bool,
    );

Map<String, dynamic> _$$_ChatSettingsToJson(_$_ChatSettings instance) =>
    <String, dynamic>{
      'replace_conversations_with_pleroma_chats':
          instance.replaceConversationsWithPleromaChats,
      'count_conversations_in_chats_unread_badges':
          instance.countConversationsInChatsUnreadBadges,
    };
