import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/conversation/conversation_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationBloc implements IDisposable, IAsyncInitLoadingBloc {
  static IConversationBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IConversationBloc>(context, listen: listen);

  IConversation get conversation;

  Stream<IConversation> get conversationStream;

  IStatus get lastStatus;

  Stream<IStatus> get lastStatusStream;

  List<IAccount> get accounts;

  Stream<List<IAccount>> get accountsStream;

  List<IAccount> get accountsWithoutMe;

  Stream<List<IAccount>> get accountsWithoutMeStream;

  Future refreshFromNetwork();
}
