import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:flutter/widgets.dart';

abstract class IPleromaChatWithLastMessage {
  IPleromaChat get chat;

  IPleromaChatMessage get lastChatMessage;
}

class PleromaChatWithLastMessageWrapper extends IPleromaChatWithLastMessage {
  @override
  IPleromaChat chat;

  @override
  IPleromaChatMessage lastChatMessage;
  PleromaChatWithLastMessageWrapper({
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
      other is PleromaChatWithLastMessageWrapper &&
          runtimeType == other.runtimeType &&
          chat == other.chat &&
          lastChatMessage == other.lastChatMessage;
  @override
  int get hashCode => chat.hashCode ^ lastChatMessage.hashCode;
}
