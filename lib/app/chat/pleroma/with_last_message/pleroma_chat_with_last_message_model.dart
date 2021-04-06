import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';

abstract class IPleromaChatWithLastMessage {
  IPleromaChat get chat;

  IPleromaChatMessage? get lastChatMessage;
}
