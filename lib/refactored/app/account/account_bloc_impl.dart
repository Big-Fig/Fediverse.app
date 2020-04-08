import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/conversation/conversation_model.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository.dart';
import 'package:fedi/refactored/app/conversation/repository/conversation_repository_model.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/refactored/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("account_bloc_impl.dart");

class AccountBloc extends DisposableOwner implements IAccountBloc {
  final BehaviorSubject<IAccount> _accountSubject;

  IPleromaAccountRelationship get accountRelationship =>
      account.pleromaRelationship;

  @override
  Stream<IPleromaAccountRelationship> get accountRelationshipStream {
    // load from network if relationship not exist locally
    if (accountRelationship == null) {
      // don't await
      refreshAccountRelationship();
    }
    return accountStream.map((account) {
      return account.pleromaRelationship;
    });
  }

  final IMyAccountBloc myAccountBloc;
  final IPleromaAccountService pleromaAccountService;
  final IAccountRepository accountRepository;
  final IConversationRepository conversationRepository;
  final bool needRefreshRelationship;
  final bool needWatchLocalRepositoryForUpdates;
  bool refreshAccountRelationshipInProgress = false;

  AccountBloc({
    @required this.accountRepository,
    @required this.conversationRepository,
    @required this.pleromaAccountService,
    @required this.myAccountBloc,
    @required IAccount account,
    bool needRefreshFromNetworkOnInit = false,
    this.needRefreshRelationship = true,
    this.needWatchLocalRepositoryForUpdates = true,
  }) : _accountSubject = BehaviorSubject.seeded(account) {
    assert(account != null);
    _logger.finest(() => "AccountBloc ${account.remoteId}");
    addDisposable(subject: _accountSubject);
    Future.delayed(Duration(seconds: 1), () {
      if (!disposed) {
        if (needWatchLocalRepositoryForUpdates) {
          addDisposable(
              streamSubscription: accountRepository
                  .watchByRemoteId(account.remoteId)
                  .listen((updatedAccount) {
//      _logger.finest(() => "oldAccount ${account.acct} updatedAccount "
//          "$updatedAccount");
            if (updatedAccount != null) {
              _accountSubject.add(updatedAccount);
            }
          }));
        }

        if (needRefreshFromNetworkOnInit == true) {
          requestRefreshFromNetwork();
        }
      }
    });
  }

  void refreshAccountRelationship() {
    _logger.finest(() => "refreshAccountRelationship "
        "refreshAccountRelationshipInProgress="
        "$refreshAccountRelationshipInProgress");
    if (refreshAccountRelationshipInProgress != true) {
      refreshAccountRelationshipInProgress = true;
      pleromaAccountService
          .relationshipWithAccounts([account.remoteId]).then((relationships) {
        _updateRelationship(relationships.first);
        refreshAccountRelationshipInProgress = false;
      }).catchError((error, stackTrace) {
        refreshAccountRelationshipInProgress = false;
        _logger.severe(
            () => "error during loading "
                "IPleromaAccountRelationship",
            error,
            stackTrace);
      });
    }
  }

  @override
  IAccount get account => _accountSubject.value;

  @override
  Stream<IAccount> get accountStream => _accountSubject.stream.distinct();

  @override
  String get acct => account.acct;

  @override
  Stream<String> get acctStream =>
      accountStream.map((account) => account.acct).distinct();

  @override
  String get avatar => account.avatar;

  @override
  Stream<String> get avatarStream =>
      accountStream.map((account) => account.avatar).distinct();

  @override
  List<IPleromaField> get fields => account.fields;

  @override
  Stream<List<IPleromaField>> get fieldsStream =>
      accountStream.map((account) => account.fields).distinct();

  @override
  int get followersCount => account.followersCount;

  @override
  Stream<int> get followersCountStream =>
      accountStream.map((account) => account.followersCount).distinct();

  @override
  int get followingCount => account.followingCount;

  @override
  Stream<int> get followingCountStream =>
      accountStream.map((account) => account.followingCount).distinct();

  @override
  String get header => account.header;

  @override
  Stream<String> get headerStream =>
      accountStream.map((account) => account.header).distinct();

  @override
  String get note => account.note;

  @override
  Stream<String> get noteStream =>
      accountStream.map((account) => account.note).distinct();

  @override
  int get statusesCount => account.statusesCount;

  @override
  Stream<int> get statusesCountStream =>
      accountStream.map((account) => account.statusesCount);

  @override
  EmojiText get displayNameEmojiText =>
      EmojiText(text: account.displayName, emojis: account.emojis);

  @override
  Stream<EmojiText> get displayNameEmojiTextStream => accountStream
      .map((account) =>
          EmojiText(text: account.displayName, emojis: account.emojis))
      .distinct();

  @override
  bool get isMyAccount => account.remoteId == myAccountBloc.account.remoteId;

  @override
  Future requestReport() => pleromaAccountService.reportAccount(
      reportRequest: PleromaAccountReportRequest(accountId: account.remoteId));

  @override
  Future<IPleromaAccountRelationship> requestToggleBlock() async {
    assert(accountRelationship != null);
    var newRelationship;
    if (accountRelationship.blocking) {
      newRelationship = await pleromaAccountService.unBlockAccount(
          accountRemoteId: account.remoteId);
    } else {
      newRelationship = await pleromaAccountService.blockAccount(
          accountRemoteId: account.remoteId);
    }
    await _updateRelationship(newRelationship);

    return newRelationship;
  }

  Future _updateRelationship(
      IPleromaAccountRelationship newRelationship) async {
    var newAccount = account.copyWith(pleromaRelationship: newRelationship);
    var newRemoteAccount = mapLocalAccountToRemoteAccount(newAccount);

    _logger.finest(() => "_updateRelationship "
        "newRelationship=$newRelationship");
    _logger.finest(() => "_updateRelationship newRemoteAccount.relationship"
        "${newRemoteAccount?.pleroma?.relationship}");
    if (account.localId != null) {
      await accountRepository.updateLocalAccountByRemoteAccount(
          oldLocalAccount: account, newRemoteAccount: newRemoteAccount);
    } else {
      // sometimes we don't have local account id, for example go from search
      // to account page
      await accountRepository.upsertRemoteAccount(newRemoteAccount,
          conversationRemoteId: null);
    }
  }

  @override
  Future<IPleromaAccountRelationship> requestToggleFollow() async {
    assert(accountRelationship != null);
    var newRelationship;
    if (accountRelationship.following) {
      newRelationship = pleromaAccountService.unFollowAccount(
          accountRemoteId: account.remoteId);
    } else {
      newRelationship = pleromaAccountService.followAccount(
          accountRemoteId: account.remoteId);
    }
    await _updateRelationship(newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> requestToggleMute() async {
    assert(accountRelationship != null);
    var newRelationship;
    if (accountRelationship.blocking) {
      newRelationship = await pleromaAccountService.unMuteAccount(
          accountRemoteId: account.remoteId);
    } else {
      newRelationship = await pleromaAccountService.muteAccount(
          accountRemoteId: account.remoteId);
    }
    await _updateRelationship(newRelationship);

    return newRelationship;
  }

  bool refreshInProgress = false;

  @override
  Future<bool> requestRefreshFromNetwork() async {
    _logger.finest(() => "requestRefreshFromNetwork start");
    var success;
    try {
      var remoteAccount = await pleromaAccountService.getAccount(
          accountRemoteId: account.remoteId);
      if (remoteAccount != null) {
        _logger.finest(
            () => "requestRefreshFromNetwork remoteAccount  $remoteAccount");

        if (account.localId != null) {
          await accountRepository.updateLocalAccountByRemoteAccount(
              oldLocalAccount: account, newRemoteAccount: remoteAccount);
        } else {
          // sometimes we don't have local account id, for example go from search
          // to account page
          await accountRepository.upsertRemoteAccount(remoteAccount,
              conversationRemoteId: null);
        }

        success = true;
      } else {
        _logger.severe(
            () => "requestRefreshFromNetwork remoteAccount  $remoteAccount");
        success = false;
      }
    } catch (e, stackTrace) {
      _logger.severe(
          () => "requestRefreshFromNetwork exception ", e, stackTrace);
      success = false;
    }

    if (needRefreshRelationship == true) {
      refreshAccountRelationship();
    }

    return success;
  }

  static AccountBloc createFromContext(BuildContext context,
      {@required IAccount account,
      @required bool needRefreshFromNetworkOnInit,
      @required bool needWatchLocalRepositoryForUpdates}) => AccountBloc(
        account: account,
        needRefreshFromNetworkOnInit: needRefreshFromNetworkOnInit,
        needWatchLocalRepositoryForUpdates: needWatchLocalRepositoryForUpdates,
        myAccountBloc: IMyAccountBloc.of(context, listen: false),
        accountRepository: IAccountRepository.of(context, listen: false),
        pleromaAccountService:
            IPleromaAccountService.of(context, listen: false),
        conversationRepository: IConversationRepository.of(context, listen:
        false));

  @override
  Future<IConversation> findRelatedConversation() => conversationRepository.getConversation(
        withAccount: account,
        olderThanConversation: null,
        newerThanConversation: null,
        orderingTermData: ConversationOrderingTermData(
            orderByType: ConversationOrderByType.remoteId,
            orderingMode: OrderingMode.desc));
}
