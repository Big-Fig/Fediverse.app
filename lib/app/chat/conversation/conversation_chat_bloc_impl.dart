import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/chat/chat_bloc_impl.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
import 'package:fedi/app/chat/conversation/message/conversation_chat_message_model.dart';
import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

class ConversationChatBloc extends ChatBloc implements IConversationChatBloc {
  // ignore: close_sinks
  final BehaviorSubject<IConversationChat> _chatSubject;

  // ignore: close_sinks
  final BehaviorSubject<IConversationChatMessage> _lastMessageSubject;

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
  final IConversationChatRepository conversationRepository;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;


  @override
  List<IAccount> get accountsWithoutMe => IAccount.excludeAccountFromList(
      accounts, (account) => !myAccountBloc.checkAccountIsMe(account));

  @override
  Stream<List<IAccount>> get accountsWithoutMeStream =>
      accountsStream.map((accounts) => IAccount.excludeAccountFromList(
          accounts, (account) => !myAccountBloc.checkAccountIsMe(account)));

  ConversationChatBloc({
    @required this.pleromaConversationService,
    @required this.myAccountBloc,
    @required this.conversationRepository,
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
  }

  @override
  void watchLocalRepositoryForUpdates() {
    addDisposable(
      streamSubscription: conversationRepository.watchByRemoteId(chat.remoteId).listen(
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
          oldLocalConversation: chat, newRemoteConversation: remoteChat);

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
      conversationRepository: IConversationChatRepository.of(context, listen: false),
      statusRepository:
          IStatusRepository.of(context, listen: false),
      accountRepository: IAccountRepository.of(context, listen: false),
    );
  }

  @override
  Future markAsRead() async {
    if (pleromaConversationService.isApiReadyToUse) {
      var lastReadChatMessageId = lastChatMessage?.remoteId;
      if (lastReadChatMessageId == null) {
        var lastStatus =
            await statusRepository.getConversationLastStatus(conversation: chat);
        lastReadChatMessageId = lastStatus?.remoteId;
      }
      var updatedRemoteChat = await pleromaConversationService.markConversationAsRead(
        conversationRemoteId: chat.remoteId,
      );

      await conversationRepository.upsertRemoteConversation(updatedRemoteChat);
    } else {
      // TODO: mark as read once app receive network connection
      await conversationRepository.markAsRead(conversation: chat);
    }
  }
}

// import 'package:fedi/app/account/account_model.dart';
// import 'package:fedi/app/account/my/my_account_bloc.dart';
// import 'package:fedi/app/account/repository/account_repository.dart';
// import 'package:fedi/app/chat/conversation/conversation_chat_bloc.dart';
// import 'package:fedi/app/chat/conversation/conversation_chat_model.dart';
// import 'package:fedi/app/chat/conversation/repository/conversation_chat_repository.dart';
// import 'package:fedi/app/status/repository/status_repository.dart';
// import 'package:fedi/app/status/status_model.dart';
// import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
// import 'package:fedi/pleroma/conversation/pleroma_conversation_model.dart';
// import 'package:fedi/pleroma/conversation/pleroma_conversation_service.dart';
// import 'package:flutter/widgets.dart';
// import 'package:moor/moor.dart';
// import 'package:rxdart/rxdart.dart';
//
// class ConversationChatBloc extends AsyncInitLoadingBloc
//     implements IConversationChatBloc {
//   final BehaviorSubject<IConversationChat> _conversationSubject;
//
//   // ignore: close_sinks
//   final BehaviorSubject<IStatus> _lastStatusSubject = BehaviorSubject();
//
//   // ignore: close_sinks
//   final BehaviorSubject<List<IAccount>> _accountsSubject = BehaviorSubject();
//
//   final IMyAccountBloc myAccountBloc;
//   final IPleromaConversationService pleromaConversationService;
//   final IConversationChatRepository conversationRepository;
//   final IStatusRepository statusRepository;
//   final IAccountRepository accountRepository;
//   final bool isNeedWatchLocalRepositoryForUpdates;
//
//   ConversationChatBloc({
//     @required this.pleromaConversationService,
//     @required this.myAccountBloc,
//     @required this.conversationRepository,
//     @required this.statusRepository,
//     @required this.accountRepository,
//     @required IConversationChat conversation,
//     bool needRefreshFromNetworkOnInit = false,
//     this.isNeedWatchLocalRepositoryForUpdates =
//         true, // todo: remove hack. Don't init when bloc quickly disposed. Help
//     //  improve performance in timeline unnecessary recreations
//     bool delayInit = true,
//   }) : _conversationSubject = BehaviorSubject.seeded(conversation) {
//     addDisposable(subject: _conversationSubject);
//     addDisposable(subject: _lastStatusSubject);
//     addDisposable(subject: _accountsSubject);
//
//     if (delayInit) {
//       Future.delayed(Duration(seconds: 1), () {
//         _init(conversation, needRefreshFromNetworkOnInit);
//       });
//     } else {
//       _init(conversation, needRefreshFromNetworkOnInit);
//     }
//   }
//
//   void _init(IConversationChat conversation, bool needRefreshFromNetworkOnInit) {
//     if (!disposed) {
//       if (isNeedWatchLocalRepositoryForUpdates) {
//         addDisposable(
//             streamSubscription: conversationRepository
//                 .watchByRemoteId(conversation.remoteId)
//                 .listen((updatedConversation) {
//           if (updatedConversation != null) {
//             _conversationSubject.add(updatedConversation);
//           }
//         }));
//
//         addDisposable(
//             streamSubscription: statusRepository
//                 .watchConversationLastStatus(conversation: conversation)
//                 .listen((lastStatus) {
//           if (lastStatus != null) {
//             _lastStatusSubject.add(lastStatus);
//           }
//         }));
//         addDisposable(
//             streamSubscription: accountRepository
//                 .watchConversationAccounts(conversation: conversation)
//                 .listen((accounts) {
//           if (accounts != null) {
//             _accountsSubject.add(accounts);
//           }
//         }));
//       }
//       if (needRefreshFromNetworkOnInit) {
//         refreshFromNetwork();
//       }
//     }
//   }
//
//   @override
//   Future internalAsyncInit() async {
//     var status = await statusRepository.getConversationLastStatus(
//         conversation: conversation);
//     if (!_lastStatusSubject.isClosed) {
//       _lastStatusSubject.add(status);
//     }
//
//     var accounts = await accountRepository.getConversationAccounts(
//         conversation: conversation);
//
//     if (!_accountsSubject.isClosed) {
//       _accountsSubject.add(accounts);
//     }
//   }
//
//   @override
//   List<IAccount> get accounts => _accountsSubject.value;
//
//   @override
//   Stream<List<IAccount>> get accountsStream => _accountsSubject.stream;
//
//   @override
//   List<IAccount> get accountsWithoutMe => IAccount.excludeAccountFromList(
//       accounts, (account) => !myAccountBloc.checkAccountIsMe(account));
//
//   @override
//   Stream<List<IAccount>> get accountsWithoutMeStream =>
//       accountsStream.map((accounts) => IAccount.excludeAccountFromList(
//           accounts, (account) => !myAccountBloc.checkAccountIsMe(account)));
//
//   @override
//   IConversationChat get conversation => _conversationSubject.value;
//
//   @override
//   Stream<IConversationChat> get conversationStream => _conversationSubject.stream;
//
//   @override
//   Future refreshFromNetwork() async {
//     var remoteConversation = await pleromaConversationService.getConversation(
//         conversationRemoteId: conversation.remoteId);
//
//     await accountRepository.upsertRemoteAccounts(remoteConversation.accounts,
//         conversationRemoteId: remoteConversation.id, chatRemoteId: null);
//
//     if (remoteConversation.lastStatus != null) {
//       await statusRepository.upsertRemoteStatus(remoteConversation.lastStatus,
//           listRemoteId: null, conversationRemoteId: remoteConversation.id);
//     }
//
//     await _updateByRemoteConversation(remoteConversation);
//   }
//
//   Future _updateByRemoteConversation(IPleromaConversation remoteConversation) =>
//       conversationRepository.updateLocalConversationByRemoteConversation(
//           oldLocalConversation: conversation,
//           newRemoteConversation: remoteConversation);
//
//   @override
//   IStatus get lastStatus => _lastStatusSubject.value;
//
//   @override
//   Stream<IStatus> get lastStatusStream => _lastStatusSubject.stream;
//
//   static ConversationChatBloc createFromContext(BuildContext context,
//       {@required IConversationChat conversation,
//       bool needRefreshFromNetworkOnInit = false}) {
//     return ConversationChatBloc(
//       pleromaConversationService:
//           IPleromaConversationService.of(context, listen: false),
//       myAccountBloc: IMyAccountBloc.of(context, listen: false),
//       conversation: conversation,
//       needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
//       conversationRepository:
//           IConversationChatRepository.of(context, listen: false),
//       statusRepository: IStatusRepository.of(context, listen: false),
//       accountRepository: IAccountRepository.of(context, listen: false),
//     );
//   }
// }
