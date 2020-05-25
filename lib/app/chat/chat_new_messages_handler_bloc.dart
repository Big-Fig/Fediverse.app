import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatNewMessagesHandlerBloc extends Disposable {
  Future handleNewMessage(IPleromaChatMessage chatMessage);
  static IChatNewMessagesHandlerBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatNewMessagesHandlerBloc>(context, listen: listen);
}