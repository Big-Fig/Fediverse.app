import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/unifedi/unifedi_chat_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatCurrentBloc implements IDisposable {
  static IUnifediChatCurrentBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IUnifediChatCurrentBloc>(
        context,
        listen: listen,
      );

  IUnifediChat? get currentChat;

  Stream<IUnifediChat?> get currentChatStream;

  void onChatOpened(IUnifediChat? chat);

  void onChatClosed(IUnifediChat? chat);
}
