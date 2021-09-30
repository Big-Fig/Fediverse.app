import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatCurrentBloc implements IDisposable {
  static IConversationChatCurrentBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatCurrentBloc>(context, listen: listen);

  IConversationChat? get currentChat;

  Stream<IConversationChat?> get currentChatStream;

  void onChatOpened(IConversationChat? chat);

  void onChatClosed(IConversationChat? chat);
}
