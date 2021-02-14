import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/chat_bloc_impl.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/pleroma_chat_message_model.dart';
import 'package:fedi/app/chat/pleroma/message/repository/pleroma_chat_message_repository.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_bloc.dart';
import 'package:fedi/app/chat/pleroma/pleroma_chat_model.dart';
import 'package:fedi/app/chat/pleroma/repository/pleroma_chat_repository.dart';
import 'package:fedi/pleroma/chat/pleroma_chat_model.dart' as pleroma_lib;
import 'package:fedi/pleroma/chat/pleroma_chat_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger("pleroma_chat_bloc_impl.dart");

class PleromaChatBloc extends ChatBloc implements IPleromaChatBloc {
  // ignore: close_sinks
  final BehaviorSubject<IPleromaChat> _chatSubject;

  // ignore: close_sinks
  final BehaviorSubject<IPleromaChatMessage> _lastMessageSubject;

  @override
  IPleromaChat get chat => _chatSubject.value;

  @override
  Stream<IPleromaChat> get chatStream => _chatSubject.stream;

  @override
  IPleromaChatMessage get lastChatMessage => _lastMessageSubject.value;

  @override
  Stream<IPleromaChatMessage> get lastChatMessageStream =>
      _lastMessageSubject.stream;

  final IMyAccountBloc myAccountBloc;
  final IPleromaChatService pleromaChatService;
  final IPleromaChatRepository chatRepository;
  final IPleromaChatMessageRepository chatMessageRepository;
  final IAccountRepository accountRepository;

  PleromaChatBloc({
    @required this.pleromaChatService,
    @required this.myAccountBloc,
    @required this.chatRepository,
    @required this.chatMessageRepository,
    @required this.accountRepository,
    @required IPleromaChat chat,
    @required IPleromaChatMessage lastChatMessage,
    bool needRefreshFromNetworkOnInit = false,
    bool isNeedWatchLocalRepositoryForUpdates =
        true, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
  })  : _chatSubject = BehaviorSubject.seeded(chat),
        _lastMessageSubject = BehaviorSubject.seeded(lastChatMessage),
        super(
          needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates,
          delayInit: delayInit,
        ) {
    _logger.finest(() => "PleromaChatBloc \n"
        " chat ${chat.remoteId} \n"
        " lastMessage $lastChatMessage");

    addDisposable(subject: _chatSubject);
    addDisposable(subject: _lastMessageSubject);
  }

  @override
  void watchLocalRepositoryForUpdates() {
    addDisposable(
      streamSubscription: chatRepository.watchByRemoteId(chat.remoteId).listen(
        (updatedChat) {
          if (updatedChat != null) {
            _chatSubject.add(updatedChat);
          }
        },
      ),
    );

    addDisposable(
      streamSubscription:
          chatMessageRepository.watchChatLastChatMessage(chat: chat).listen(
        (lastMessage) {
          _logger.finest(() => "watchChatLastChatMessage \n"
              " chat ${chat.remoteId} \n"
              " lastMessage $lastMessage");
          if (lastMessage != null) {
            _lastMessageSubject.add(lastMessage);
          }
        },
      ),
    );
  }

  @override
  Future internalAsyncInit() async {
    var message =
        await chatMessageRepository.getChatLastChatMessage(chat: chat);
    if (!_lastMessageSubject.isClosed) {
      _lastMessageSubject.add(message);
    }
  }

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
      chatMessageRepository:
          IPleromaChatMessageRepository.of(context, listen: false),
      accountRepository: IAccountRepository.of(context, listen: false),
    );
  }

  @override
  Future markAsRead() async {
    if (chat.unread != null && chat.unread > 0) {
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
  }

  @override
  bool get isCountInUnreadSupported => true;

  @override
  Future deleteMessages(List<IChatMessage> chatMessages) async {
    // create queue instead of parallel request to avoid throttle limit on server
    for (var chatMessage in chatMessages) {
      var remoteId = chatMessage.remoteId;
      await pleromaChatService.deleteChatMessage(
        chatId: chat.remoteId,
        chatMessageRemoteId: remoteId,
      );

      await chatMessageRepository.markChatMessageAsDeleted(
        chatMessageRemoteId: remoteId,
      );
    }
  }

  @override
  Future performActualDelete() {
    throw UnsupportedError("It is not possible to delete pleroma chat");
  }
}
