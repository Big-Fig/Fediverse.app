import 'package:fedi_app/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi_app/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi_app/obj/equal_comparable_obj.dart';

abstract class IConversationChatWithLastMessage
    implements IEqualComparableObj<IConversationChatWithLastMessage> {
  IConversationChat get chat;

  IConversationChatMessage? get lastChatMessage;
}

class SimpleConversationChatWithLastMessage
    implements IConversationChatWithLastMessage {
  @override
  final IConversationChat chat;

  @override
  final IConversationChatMessage? lastChatMessage;

  SimpleConversationChatWithLastMessage({
    required this.chat,
    required this.lastChatMessage,
  });

  @override
  int compareTo(IConversationChatWithLastMessage b) =>
      IConversationChat.compareItemsToSort(
        chat,
        b.chat,
      );

  @override
  bool isEqualTo(IConversationChatWithLastMessage b) =>
      IConversationChat.isItemsEqual(
        chat,
        b.chat,
      );
}
