import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ICurrentChatBloc implements Disposable {
  static ICurrentChatBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ICurrentChatBloc>(context, listen: listen);

  IChat get currentChat;

  Stream<IChat> get currentChatStream;

  void onChatOpened(IChat chat);

  void onChatClosed(IChat chat);
}
