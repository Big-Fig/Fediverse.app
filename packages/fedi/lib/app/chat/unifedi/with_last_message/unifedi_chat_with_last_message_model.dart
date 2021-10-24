import 'package:fedi/app/chat/unifedi/message/unifedi_chat_message_model.dart';
import 'package:fedi/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:fedi/obj/equal_comparable_obj.dart';

abstract class IUnifediChatWithLastMessage
    implements IEqualComparableObj<IUnifediChatWithLastMessage> {
  IUnifediChat get chat;

  IUnifediChatMessage? get lastChatMessage;
}

class SimpleUnifediChatWithLastMessage implements IUnifediChatWithLastMessage {
  @override
  final IUnifediChat chat;

  @override
  final IUnifediChatMessage? lastChatMessage;

  SimpleUnifediChatWithLastMessage({
    required this.chat,
    required this.lastChatMessage,
  });

  @override
  int compareTo(IUnifediChatWithLastMessage b) =>
      IUnifediChat.compareItemsToSort(
        chat,
        b.chat,
      );

  @override
  bool isEqualTo(IUnifediChatWithLastMessage b) => IUnifediChat.isItemsEqual(
        chat,
        b.chat,
      );
}
