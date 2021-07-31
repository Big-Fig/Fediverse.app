import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatNewMessagesHandlerBloc extends IDisposable {
  Future handleChatUpdate(IPleromaApiConversation conversation);

  static IConversationChatNewMessagesHandlerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatNewMessagesHandlerBloc>(
        context,
        listen: listen,
      );
}
