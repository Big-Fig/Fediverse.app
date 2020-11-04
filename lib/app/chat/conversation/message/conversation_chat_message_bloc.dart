import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/message/chat_message_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatMessageBloc implements IChatMessageBloc {
  static IConversationChatMessageBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatMessageBloc>(context, listen: listen);

  @override
  IConversationChatMessage get chatMessage;

  @override
  Stream<IConversationChatMessage> get chatMessageStream;
}
