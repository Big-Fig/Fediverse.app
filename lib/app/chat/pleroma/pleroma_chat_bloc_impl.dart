import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

class PleromaChatBloc extends AsyncInitLoadingBloc implements IPleromaChatBloc {
  final BehaviorSubject<IPleromaChat> _chatSubject;

  // ignore: close_sinks
  final BehaviorSubject<IPleromaChatMessage> _lastMessageSubject;

  final IMyAccountBloc myAccountBloc;
  final IPleromaChatService pleromaChatService;
  final IPleromaChatRepository chatRepository;
  final IPleromaChatMessageRepository chatMessageRepository;
  final IAccountRepository accountRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  PleromaChatBloc({
    @required this.pleromaChatService,
    @required this.myAccountBloc,
    @required this.chatRepository,
    @required this.chatMessageRepository,
    @required this.accountRepository,
    @required IPleromaChat chat,
    @required IPleromaChatMessage lastChatMessage,
    bool needRefreshFromNetworkOnInit = false,
    this.isNeedWatchLocalRepositoryForUpdates =
        true, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
  })  : _chatSubject = BehaviorSubject.seeded(chat),
        _lastMessageSubject = BehaviorSubject.seeded(lastChatMessage) {
    addDisposable(subject: _chatSubject);
    addDisposable(subject: _lastMessageSubject);

    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(chat, needRefreshFromNetworkOnInit);
      });
    } else {
      _init(chat, needRefreshFromNetworkOnInit);
    }
  }

  void _init(IPleromaChat chat, bool needRefreshFromNetworkOnInit) {
    if (!disposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        addDisposable(
            streamSubscription: chatRepository
                .watchByRemoteId(chat.remoteId)
                .listen((updatedChat) {
          if (updatedChat != null) {
            _chatSubject.add(updatedChat);
          }
        }));

        addDisposable(
            streamSubscription: chatMessageRepository
                .watchChatLastChatMessage(chat: chat)
                .listen((lastMessage) {
          if (lastMessage != null) {
            _lastMessageSubject.add(lastMessage);
          }
        }));
//        addDisposable(
//            streamSubscription: accountRepository
//                .watchChatAccounts(chat: chat)
//                .listen((accounts) {
//          if (accounts != null) {
//            _accountsSubject.add(accounts);
//          }
//        }));
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  @override
  Future internalAsyncInit() async {
    var message =
        await chatMessageRepository.getChatLastChatMessage(chat: chat);
    if (!_lastMessageSubject.isClosed) {
      _lastMessageSubject.add(message);
    }

//    var accounts = await accountRepository.getChatAccounts(chat: chat);
//
//    if (!_accountsSubject.isClosed) {
//      _accountsSubject.add(accounts);
//    }
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
  IPleromaChat get chat => _chatSubject.value;

  @override
  Stream<IPleromaChat> get chatStream => _chatSubject.stream;

  @override
  Future refreshFromNetwork() async {
    var remoteChat = await pleromaChatService.getChat(id: chat.remoteId);

    await accountRepository.upsertRemoteAccount(remoteChat.account,
        chatRemoteId: remoteChat.id, conversationRemoteId: null);

    if (remoteChat.lastMessage != null) {
      await chatMessageRepository
          .upsertRemoteChatMessage(remoteChat.lastMessage);
    }

    await _updateByRemoteChat(remoteChat);
  }

  Future _updateByRemoteChat(pleroma_lib.IPleromaChat remoteChat) =>
      chatRepository.updateLocalChatByRemoteChat(
          oldLocalChat: chat, newRemoteChat: remoteChat);

  @override
  IPleromaChatMessage get lastChatMessage => _lastMessageSubject.value;

  @override
  Stream<IPleromaChatMessage> get lastChatMessageStream => _lastMessageSubject.stream;

  static PleromaChatBloc createFromContext(
    BuildContext context, {
    @required IPleromaChat chat,
    @required IPleromaChatMessage lastChatMessage,
    bool needRefreshFromNetworkOnInit = false,
  }) {
    return PleromaChatBloc(
      pleromaChatService: IPleromaChatService.of(context, listen: false),
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
      chat: chat,
      lastChatMessage: lastChatMessage,
      needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
      chatRepository: IPleromaChatRepository.of(context, listen: false),
      chatMessageRepository: IPleromaChatMessageRepository.of(context, listen: false),
      accountRepository: IAccountRepository.of(context, listen: false),
    );
  }

  @override
  Future markAsRead() async {
    if (pleromaChatService.isApiReadyToUse) {
      var lastReadChatMessageId = lastChatMessage?.remoteId;
      if (lastReadChatMessageId == null) {
        var lastMessage =
            await chatMessageRepository.getChatLastChatMessage(chat: chat);
        lastReadChatMessageId = lastMessage?.remoteId;
      }
      var updatedRemoteChat = await pleromaChatService.markChatAsRead(
        chatId: chat.remoteId,
        lastReadChatMessageId: lastReadChatMessageId,
      );

      await chatRepository.upsertRemoteChat(updatedRemoteChat);
    } else {
      // TODO: mark as read once app receive network connection
      await chatRepository.markAsRead(chat: chat);
    }
  }

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
