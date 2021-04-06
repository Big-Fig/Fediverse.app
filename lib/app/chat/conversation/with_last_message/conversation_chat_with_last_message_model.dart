import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';

abstract class IConversationChatWithLastMessage {
  IConversationChat get chat;

  IConversationChatMessage? get lastChatMessage;
}
