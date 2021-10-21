import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IConversationChatNewMessagesHandlerBloc extends IDisposable {
  Future<void> handleChatUpdate(IUnifediApiConversation conversation);

  static IConversationChatNewMessagesHandlerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatNewMessagesHandlerBloc>(
        context,
        listen: listen,
      );
}
