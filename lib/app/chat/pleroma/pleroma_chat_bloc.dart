import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatBloc implements IDisposable, IAsyncInitLoadingBloc {
  static IPleromaChatBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaChatBloc>(context, listen: listen);

  IPleromaChat get chat;

  Stream<IPleromaChat> get chatStream;

  int get unreadCount;

  Stream<int> get unreadCountStream;

  bool get isHaveUnread;

  Stream<bool> get isHaveUnreadStream;

  IPleromaChatMessage get lastChatMessage;

  Stream<IPleromaChatMessage> get lastChatMessageStream;

  List<IAccount> get accounts;

  Stream<List<IAccount>> get accountsStream;

  DateTime get updatedAt;

  Stream<DateTime> get updatedAtStream;

  Future refreshFromNetwork();

  Future markAsRead();
}
