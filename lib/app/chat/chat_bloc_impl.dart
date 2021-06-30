import 'dart:async';

import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/chat/chat_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:easy_dispose/easy_dispose.dart';

abstract class ChatBloc extends AsyncInitLoadingBloc implements IChatBloc {
  final bool isNeedWatchLocalRepositoryForUpdates;

  final StreamController<bool> chatDeletedStreamController =
      StreamController.broadcast();

  @override
  Stream<bool> get chatDeletedStream => chatDeletedStreamController.stream;

  ChatBloc({
    required bool needRefreshFromNetworkOnInit,
    required this.isNeedWatchLocalRepositoryForUpdates,
    // todo: remove hack. Dont init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    required bool delayInit,
  }) {
    chatDeletedStreamController.disposeWith(this);
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
    if (!isDisposed) {
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
  DateTime? get updatedAt => chat.updatedAt;

  @override
  Stream<DateTime?> get updatedAtStream =>
      chatStream.map((chat) => chat.updatedAt);

  @override
  Future refreshFromNetwork();

  @override
  bool get isHaveUnread => unreadCount! > 0;

  @override
  Stream<bool> get isHaveUnreadStream =>
      unreadCountStream.map((unreadCount) => unreadCount! > 0);

  @override
  int? get unreadCount => chat.unread;

  @override
  Stream<int?> get unreadCountStream => chatStream.map((chat) => chat.unread);

  @override
  Future delete() async {
    await performActualDelete();

    chatDeletedStreamController.add(true);
  }

  Future performActualDelete();
}
