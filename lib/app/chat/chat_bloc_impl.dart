import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/app/chat/chat_model.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class ChatBloc extends AsyncInitLoadingBloc implements IChatBloc {
  // ignore: close_sinks
  BehaviorSubject<IChat> get _chatSubject;

  // ignore: close_sinks
  BehaviorSubject<IChatMessage> get _lastMessageSubject;

  final bool isNeedWatchLocalRepositoryForUpdates;

  ChatBloc({
    @required bool needRefreshFromNetworkOnInit,
    @required this.isNeedWatchLocalRepositoryForUpdates,
    // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    @required bool delayInit,
  }) {
    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(needRefreshFromNetworkOnInit);
      });
    } else {
      _init(needRefreshFromNetworkOnInit);
    }
  }

  void watchLocalRepositoryForUpdates();

  void _init(bool needRefreshFromNetworkOnInit) {
    if (!disposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        watchLocalRepositoryForUpdates();
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  @override
  List<IAccount> get accounts => chat.accounts;

  @override
  Stream<List<IAccount>> get accountsStream =>
      chatStream.map((chat) => chat.accounts);

  @override
  DateTime get updatedAt => chat.updatedAt;

  @override
  Stream<DateTime> get updatedAtStream =>
      chatStream.map((chat) => chat.updatedAt);

  @override
  IChat get chat => _chatSubject.value;

  @override
  Stream<IChat> get chatStream => _chatSubject.stream;

  @override
  Future refreshFromNetwork();

  @override
  IChatMessage get lastChatMessage => _lastMessageSubject.value;

  @override
  Stream<IChatMessage> get lastChatMessageStream => _lastMessageSubject.stream;

  @override
  bool get isHaveUnread => unreadCount > 0;

  @override
  Stream<bool> get isHaveUnreadStream =>
      unreadCountStream.map((unreadCount) => unreadCount > 0);

  @override
  int get unreadCount => chat.unread;

  @override
  Stream<int> get unreadCountStream => chatStream.map((chat) => chat.unread);
}
