import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatNewMessagesHandlerBloc extends IDisposable {
  Future handleNewMessage(IUnifediApiChatMessage chatMessage);

  Future handleChatUpdate(IUnifediApiChat chat);

  static IPleromaChatNewMessagesHandlerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatNewMessagesHandlerBloc>(
        context,
        listen: listen,
      );
}
