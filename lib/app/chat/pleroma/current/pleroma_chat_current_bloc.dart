import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatCurrentBloc implements IDisposable {
  static IPleromaChatCurrentBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaChatCurrentBloc>(context, listen: listen);

  IPleromaChat? get currentChat;

  Stream<IPleromaChat?> get currentChatStream;

  void onChatOpened(IPleromaChat? chat);

  void onChatClosed(IPleromaChat? chat);
}
