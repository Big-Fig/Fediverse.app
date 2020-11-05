import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatNewMessagesHandlerBloc extends IDisposable {
  Future handleChatUpdate(IPleromaConversation conversation);

  static IConversationChatNewMessagesHandlerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IConversationChatNewMessagesHandlerBloc>(context,
          listen: listen);
}
