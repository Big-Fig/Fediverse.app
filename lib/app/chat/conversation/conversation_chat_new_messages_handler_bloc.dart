import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatNewMessagesHandlerBloc extends IDisposable {
  Future handleChatUpdate(IUnifediApiConversation conversation);

  static IConversationChatNewMessagesHandlerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IConversationChatNewMessagesHandlerBloc>(
        context,
        listen: listen,
      );
}
