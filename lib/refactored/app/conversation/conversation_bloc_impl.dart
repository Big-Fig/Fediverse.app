import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/conversation/conversation_bloc.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/status/repository/status_repository.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_model.dart';
import 'package:fedi/refactored/pleroma/conversation/pleroma_conversation_service.dart';
import 'package:flutter/widgets.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

class ConversationBloc extends AsyncInitLoadingBloc
    implements IConversationBloc {
  final BehaviorSubject<IConversation> _conversationSubject;

  // ignore: close_sinks
  final BehaviorSubject<IStatus> _lastStatusSubject = BehaviorSubject();

  // ignore: close_sinks
  final BehaviorSubject<List<IAccount>> _accountsSubject = BehaviorSubject();

  final IMyAccountBloc myAccountBloc;
  final IPleromaConversationService pleromaConversationService;
  final IConversationRepository conversationRepository;
  final IStatusRepository statusRepository;
  final IAccountRepository accountRepository;
  final bool isNeedWatchLocalRepositoryForUpdates;

  ConversationBloc({
    @required this.pleromaConversationService,
    @required this.myAccountBloc,
    @required this.conversationRepository,
    @required this.statusRepository,
    @required this.accountRepository,
    @required IConversation conversation,
    bool needRefreshFromNetworkOnInit = false,
    this.isNeedWatchLocalRepositoryForUpdates =
        true, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
  }) : _conversationSubject = BehaviorSubject.seeded(conversation) {
    addDisposable(subject: _conversationSubject);
    addDisposable(subject: _lastStatusSubject);
    addDisposable(subject: _accountsSubject);

    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(conversation, needRefreshFromNetworkOnInit);
      });
    } else {
      _init(conversation, needRefreshFromNetworkOnInit);
    }
  }

  void _init(IConversation conversation, bool needRefreshFromNetworkOnInit) {
    if (!disposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        addDisposable(
            streamSubscription: conversationRepository
                .watchByRemoteId(conversation.remoteId)
                .listen((updatedConversation) {
          if (updatedConversation != null) {
            _conversationSubject.add(updatedConversation);
          }
        }));

        addDisposable(
            streamSubscription: statusRepository
                .watchConversationLastStatus(conversation: conversation)
                .listen((lastStatus) {
          if (lastStatus != null) {
            _lastStatusSubject.add(lastStatus);
          }
        }));
        addDisposable(
            streamSubscription: accountRepository
                .watchConversationAccounts(conversation: conversation)
                .listen((accounts) {
          if (accounts != null) {
            _accountsSubject.add(accounts);
          }
        }));
      }
      if (needRefreshFromNetworkOnInit) {
        refreshFromNetwork();
      }
    }
  }

  @override
  Future internalAsyncInit() async {
    var status = await statusRepository.getConversationLastStatus(
        conversation: conversation);
    if (!_lastStatusSubject.isClosed) {
      _lastStatusSubject.add(status);
    }

    var accounts = await accountRepository.getConversationAccounts(
        conversation: conversation);

    if (!_accountsSubject.isClosed) {
      _accountsSubject.add(accounts);
    }
  }

  @override
  List<IAccount> get accounts => _accountsSubject.value;

  @override
  Stream<List<IAccount>> get accountsStream => _accountsSubject.stream;

  @override
  List<IAccount> get accountsWithoutMe => IAccount.excludeAccountFromList(
      accounts, (account) => !myAccountBloc.checkAccountIsMe(account));

  @override
  Stream<List<IAccount>> get accountsWithoutMeStream =>
      accountsStream.map((accounts) => IAccount.excludeAccountFromList(
          accounts, (account) => !myAccountBloc.checkAccountIsMe(account)));

  @override
  IConversation get conversation => _conversationSubject.value;

  @override
  Stream<IConversation> get conversationStream => _conversationSubject.stream;

  @override
  Future refreshFromNetwork() async {
    var remoteConversation = await pleromaConversationService.getConversation(
        conversationRemoteId: conversation.remoteId);

    await accountRepository.upsertRemoteAccounts(remoteConversation.accounts,
        conversationRemoteId: remoteConversation.id, chatRemoteId: null);

    if (remoteConversation.lastStatus != null) {
      await statusRepository.upsertRemoteStatus(remoteConversation.lastStatus,
          listRemoteId: null, conversationRemoteId: remoteConversation.id);
    }

    await _updateByRemoteConversation(remoteConversation);
  }

  Future _updateByRemoteConversation(IPleromaConversation remoteConversation) =>
      conversationRepository.updateLocalConversationByRemoteConversation(
          oldLocalConversation: conversation,
          newRemoteConversation: remoteConversation);

  @override
  IStatus get lastStatus => _lastStatusSubject.value;

  @override
  Stream<IStatus> get lastStatusStream => _lastStatusSubject.stream;

  static ConversationBloc createFromContext(BuildContext context,
      {@required IConversation conversation,
      bool needRefreshFromNetworkOnInit = false}) {
    return ConversationBloc(
      pleromaConversationService:
          IPleromaConversationService.of(context, listen: false),
      myAccountBloc: IMyAccountBloc.of(context, listen: false),
      conversation: conversation,
      needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
      conversationRepository:
          IConversationRepository.of(context, listen: false),
      statusRepository: IStatusRepository.of(context, listen: false),
      accountRepository: IAccountRepository.of(context, listen: false),
    );
  }
}
