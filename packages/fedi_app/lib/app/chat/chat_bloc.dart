import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/chat/chat_model.dart';
import 'package:fedi_app/app/chat/message/chat_message_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IChatBloc implements IDisposable, IAsyncInitLoadingBloc {
  bool get isDeletePossible;

  static IChatBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IChatBloc>(
        context,
        listen: listen,
      );

  IChat get chat;

  Stream<IChat> get chatStream;

  int? get unreadCount;

  Stream<int?> get unreadCountStream;

  bool get isCountInUnreadSupported;

  bool get isHaveUnread;

  Stream<bool> get isHaveUnreadStream;

  IChatMessage? get lastChatMessage;

  IChatMessage? get lastPublishedChatMessage;

  Stream<IChatMessage?> get lastChatMessageStream;

  List<IAccount> get accounts;

  Stream<List<IAccount>> get accountsStream;

  DateTime? get updatedAt;

  Stream<DateTime?> get updatedAtStream;

  Future<void> refreshFromNetwork();

  Future<void> markAsRead();

  Future<void> deleteMessages(List<IChatMessage> chatMessages);

  Future<void> delete();

  Stream<bool> get chatDeletedStream;
}
