import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';

abstract class IConversationChatWithLastMessage
    implements IEqualComparableObj<IConversationChatWithLastMessage> {
  IConversationChat get chat;

  IConversationChatMessage? get lastChatMessage;
}
