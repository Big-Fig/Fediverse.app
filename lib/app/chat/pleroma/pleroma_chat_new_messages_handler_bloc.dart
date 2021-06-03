import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/api/chat/pleroma_api_chat_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatNewMessagesHandlerBloc extends IDisposable {
  Future handleNewMessage(IPleromaApiChatMessage chatMessage);
  Future handleChatUpdate(IPleromaApiChat chat);
  static IPleromaChatNewMessagesHandlerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaChatNewMessagesHandlerBloc>(context, listen: listen);

}