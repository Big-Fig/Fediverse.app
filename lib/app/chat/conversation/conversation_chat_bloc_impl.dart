import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/account/repository/account_repository_model.dart';
import 'package:fedi/app/chat/chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/chat/message/chat_message_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:fedi/pleroma/status/auth/pleroma_auth_status_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

Function eq = const ListEquality().equals;

class ConversationChatBloc extends ChatBloc implements IConversationChatBloc {
  // ignore: close_sinks
  final BehaviorSubject<IConversationChat> _chatSubject;

  // ignore: close_sinks
  final BehaviorSubject<IConversationChatMessage> _lastMessageSubject;

  final BehaviorSubject<List<IAccount>> _accountsSubject = BehaviorSubject();

  @override
  List<IAccount> get accounts => _accountsSubject.value;

  @override
  Stream<List<IAccount>> get accountsStream =>
      _accountsSubject.stream.distinct((a, b) => eq(a, b));

  @override
  IConversationChat get chat => _chatSubject.value;

  @override
  Stream<IConversationChat> get chatStream => _chatSubject.stream;

  @override
  IConversationChatMessage get lastChatMessage => _lastMessageSubject.value;

  @override
  Stream<IConversationChatMessage> get lastChatMessageStream =>
      _lastMessageSubject.stream;

  final IMyAccountBloc myAccountBloc;
  final IPleromaConversationService pleromaConversationService;
  final IPleromaAuthStatusService pleromaAuthStatusService;
  final IConversationChatRepository conversationRepository;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;

  @override
  List<IAccount> get accountsWithoutMe => accounts;

  @override
  Stream<List<IAccount>> get accountsWithoutMeStream => accountsStream;

  ConversationChatBloc({
    @required this.pleromaConversationService,
    @required this.myAccountBloc,
    @required this.conversationRepository,
    @required this.pleromaAuthStatusService,
    @required this.statusRepository,
    @required this.accountRepository,
    @required IConversationChat conversation,
    @required IConversationChatMessage lastChatMessage,
    bool needRefreshFromNetworkOnInit = false,
    bool isNeedWatchLocalRepositoryForUpdates =
        true, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
  })  : _chatSubject = BehaviorSubject.seeded(conversation),
        _lastMessageSubject = BehaviorSubject.seeded(lastChatMessage),
        super(
          needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates,
          delayInit: delayInit,
        ) {
    addDisposable(subject: _chatSubject);
    addDisposable(subject: _lastMessageSubject);
    addDisposable(subject: _accountsSubject);

    listenForAccounts(conversation);
  }

  void listenForAccounts(IConversationChat conversation) {
    addDisposable(
      streamSubscription: accountRepository
          .watchAccounts(
        filters: AccountRepositoryFilters.createForOnlyInConversation(
          conversation: conversation,
        ),
        pagination: null,
      )
          .listen(
        (accounts) {
          var accountsWithoutMe = IAccount.excludeAccountFromList(
            accounts,
            (account) => !myAccountBloc.checkAccountIsMe(account),
          );
          accountsWithoutMe.sort(
            (a, b) => a.remoteId.compareTo(b.remoteId),
          );
          _accountsSubject.add(accountsWithoutMe);
        },
      ),
    );
  }

  @override
  void watchLocalRepositoryForUpdates() {
    addDisposable(
      streamSubscription:
          conversationRepository.watchByRemoteId(chat.remoteId).listen(
        (updatedChat) {
          if (updatedChat != null) {
            _chatSubject.add(updatedChat);
          }
        },
      ),
    );

    addDisposable(
      streamSubscription: statusRepository
          .watchConversationLastStatus(conversation: chat)
          .listen(
        (lastStatus) {
          if (lastStatus != null) {
            _lastMessageSubject.add(
              ConversationChatMessageStatusAdapter(lastStatus),
            );
          }
        },
      ),
    );
  }

  @override
  Future internalAsyncInit() async {
    var message =
        await statusRepository.getConversationLastStatus(conversation: chat);
    if (!_lastMessageSubject.isClosed) {
      _lastMessageSubject.add(
        ConversationChatMessageStatusAdapter(message),
      );
    }
  }

  @override
  Future refreshFromNetwork() async {
    var remoteConversation = await pleromaConversationService.getConversation(
        conversationRemoteId: chat.remoteId);

    if (remoteConversation.accounts?.isNotEmpty == true) {
      for (var account in remoteConversation.accounts) {
        await accountRepository.upsertRemoteAccount(
          account,
          chatRemoteId: null,
          conversationRemoteId: remoteConversation.id,
        );
      }
    }

    if (remoteConversation.lastStatus != null) {
      await statusRepository.upsertRemoteStatus(remoteConversation.lastStatus,
          conversationRemoteId: remoteConversation.id, listRemoteId: null);
    }

    await _updateByRemoteChat(remoteConversation);
  }

  Future _updateByRemoteChat(IPleromaConversation remoteChat) =>
      conversationRepository.updateLocalConversationByRemoteConversation(
        oldLocalConversation: chat,
        newRemoteConversation: remoteChat,
      );

  static ConversationChatBloc createFromContext(
    BuildContext context, {
    @required IConversationChat chat,
    @required IConversationChatMessage lastChatMessage,
    bool needRefreshFromNetworkOnInit = false,
  }) {
    return ConversationChatBloc(
      pleromaConversationService:
          IPleromaConversationService.of(context, listen: false),
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
      conversation: chat,
      lastChatMessage: lastChatMessage,
      needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
      conversationRepository:
          IConversationChatRepository.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      accountRepository: IAccountRepository.of(context, listen: false),
      pleromaAuthStatusService: IPleromaAuthStatusService.of(
        context,
        listen: false,
      ),
    );
  }

  @override
  Future markAsRead() async {
    if (chat.unread != null && chat.unread > 0) {
      if (pleromaConversationService.isApiReadyToUse) {
        var lastReadChatMessageId = lastChatMessage?.remoteId;
        if (lastReadChatMessageId == null) {
          var lastStatus = await statusRepository.getConversationLastStatus(
              conversation: chat);
          lastReadChatMessageId = lastStatus?.remoteId;
        }
        var updatedRemoteChat =
            await pleromaConversationService.markConversationAsRead(
          conversationRemoteId: chat.remoteId,
        );

        await conversationRepository
            .upsertRemoteConversation(updatedRemoteChat);
      } else {
        // TODO: mark as read once app receive network connection
        await conversationRepository.markAsRead(conversation: chat);
      }
    }
  }

  @override
  bool get isCountInUnreadSupported => false;

  @override
  Future deleteMessages(List<IChatMessage> chatMessages) async {
    // create queue instead of parallel request to avoid throttle limit on server
    for (var chatMessage in chatMessages) {
      await pleromaAuthStatusService.deleteStatus(
        statusRemoteId: chatMessage.remoteId,
      );
      await statusRepository.deleteByRemoteId(
        chatMessage.remoteId,
      );
    }
  }

  @override
  Future performActualDelete() async {
    var remoteId = conversation.remoteId;
    await pleromaConversationService.deleteConversation(
      conversationRemoteId: remoteId,
    );

    await conversationRepository.deleteByRemoteId(remoteId);
  }
}
