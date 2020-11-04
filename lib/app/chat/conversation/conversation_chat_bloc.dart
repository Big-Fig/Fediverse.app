import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationChatBloc implements IDisposable, IAsyncInitLoadingBloc {
  static IConversationChatBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IConversationChatBloc>(context, listen: listen);

  IConversationChat get conversation;

  Stream<IConversationChat> get conversationStream;

  IStatus get lastStatus;

  Stream<IStatus> get lastStatusStream;

  List<IAccount> get accounts;

  Stream<List<IAccount>> get accountsStream;

  List<IAccount> get accountsWithoutMe;

  Stream<List<IAccount>> get accountsWithoutMeStream;

  Future refreshFromNetwork();
}
