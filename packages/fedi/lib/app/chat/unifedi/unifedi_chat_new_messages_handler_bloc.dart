import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IUnifediChatNewMessagesHandlerBloc extends IDisposable {
  Future<void> handleNewMessage(IUnifediApiChatMessage chatMessage);

  Future<void> handleChatUpdate(IUnifediApiChat chat);

  static IUnifediChatNewMessagesHandlerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatNewMessagesHandlerBloc>(
        context,
        listen: listen,
      );
}
