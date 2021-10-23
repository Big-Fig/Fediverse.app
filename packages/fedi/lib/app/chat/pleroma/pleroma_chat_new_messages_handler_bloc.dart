import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IPleromaChatNewMessagesHandlerBloc extends IDisposable {
  Future<void> handleNewMessage(IUnifediApiChatMessage chatMessage);

  Future<void> handleChatUpdate(IUnifediApiChat chat);

  static IPleromaChatNewMessagesHandlerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatNewMessagesHandlerBloc>(
        context,
        listen: listen,
      );
}
