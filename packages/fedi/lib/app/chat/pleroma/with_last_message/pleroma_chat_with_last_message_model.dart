import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';

abstract class IPleromaChatWithLastMessage
    implements IEqualComparableObj<IPleromaChatWithLastMessage> {
  IPleromaChat get chat;

  IPleromaChatMessage? get lastChatMessage;
}

class SimplePleromaChatWithLastMessage implements IPleromaChatWithLastMessage {
  @override
  final IPleromaChat chat;

  @override
  final IPleromaChatMessage? lastChatMessage;

  SimplePleromaChatWithLastMessage({
    required this.chat,
    required this.lastChatMessage,
  });

  @override
  int compareTo(IPleromaChatWithLastMessage b) =>
      IPleromaChat.compareItemsToSort(
        chat,
        b.chat,
      );

  @override
  bool isEqualTo(IPleromaChatWithLastMessage b) => IPleromaChat.isItemsEqual(
        chat,
        b.chat,
      );
}
