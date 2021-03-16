import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';

abstract class IConversationChatWithLastMessage {
  IConversationChat get chat;

  IConversationChatMessage? get lastChatMessage;
}

class ConversationChatWithLastMessageWrapper
    extends IConversationChatWithLastMessage {
  @override
  IConversationChat chat;

  @override
  IConversationChatMessage? lastChatMessage;

  ConversationChatWithLastMessageWrapper({
    required this.chat,
    required this.lastChatMessage,
  });

  @override
  String toString() {
    return 'ChatWithLastMessageWrapper{'
        'chat: $chat, '
        'lastChatMessage: $lastChatMessage'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationChatWithLastMessageWrapper &&
          runtimeType == other.runtimeType &&
          chat == other.chat &&
          lastChatMessage == other.lastChatMessage;

  @override
  int get hashCode => chat.hashCode ^ lastChatMessage.hashCode;
}
