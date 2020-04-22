import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IConversationBloc implements Disposable, IAsyncInitLoadingBloc {
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

  Future updateFromNetwork();
}
