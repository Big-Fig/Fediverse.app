import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/chat/chat_model.dart';
import 'package:fedi/refactored/app/chat/message/chat_message_model.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatBloc implements Disposable, IAsyncInitLoadingBloc {
  static IChatBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatBloc>(context, listen: listen);

  IChat get chat;

  Stream<IChat> get chatStream;

  IChatMessage get lastMessage;

  Stream<IChatMessage> get lastMessageStream;

  List<IAccount> get accounts;

  Stream<List<IAccount>> get accountsStream;

  List<IAccount> get accountsWithoutMe;

  Stream<List<IAccount>> get accountsWithoutMeStream;

  Future refreshFromNetwork();
}
