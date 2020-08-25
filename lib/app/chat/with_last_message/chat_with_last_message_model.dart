import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:flutter/widgets.dart';

abstract class IChatWithLastMessage {
  IChat get chat;

  IChatMessage get lastChatMessage;
}

class ChatWithLastMessageWrapper extends IChatWithLastMessage {
  @override
  IChat chat;

  @override
  IChatMessage lastChatMessage;
  ChatWithLastMessageWrapper({
    @required this.chat,
    @required this.lastChatMessage,
  });

  @override
  String toString() {
    return 'ChatWithLastMessageWrapper{chat: $chat,'
        ' lastChatMessage: $lastChatMessage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatWithLastMessageWrapper &&
          runtimeType == other.runtimeType &&
          chat == other.chat &&
          lastChatMessage == other.lastChatMessage;
  @override
  int get hashCode => chat.hashCode ^ lastChatMessage.hashCode;
}
