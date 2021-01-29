import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatBloc implements IDisposable, IAsyncInitLoadingBloc {
  static IChatBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IChatBloc>(context, listen: listen);

  IChat get chat;

  Stream<IChat> get chatStream;

  int get unreadCount;

  Stream<int> get unreadCountStream;

  bool get isCountInUnreadSupported;

  bool get isHaveUnread;

  Stream<bool> get isHaveUnreadStream;

  IChatMessage get lastChatMessage;

  Stream<IChatMessage> get lastChatMessageStream;

  List<IAccount> get accounts;

  Stream<List<IAccount>> get accountsStream;

  DateTime get updatedAt;

  Stream<DateTime> get updatedAtStream;

  Future refreshFromNetwork();

  Future markAsRead();

  Future deleteMessages(List<IChatMessage> chatMessages);

  Future delete();

  Stream<bool> get chatDeletedStream;
}
