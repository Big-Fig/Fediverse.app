import 'package:easy_dispose/easy_dispose.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatNewMessagesHandlerBloc extends IDisposable {
  Future handleNewMessage(IPleromaApiChatMessage chatMessage);

  Future handleChatUpdate(IPleromaApiChat chat);

  static IPleromaChatNewMessagesHandlerBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaChatNewMessagesHandlerBloc>(
        context,
        listen: listen,
      );
}
