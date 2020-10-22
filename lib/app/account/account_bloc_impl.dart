import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/emoji/text/emoji_text_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/websockets/pleroma_websockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("account_bloc_impl.dart");

class AccountBloc extends IAccountBloc {
  final IMyAccount myAccount;

  final BehaviorSubject<IPleromaAccountRelationship>
      _accountRelationshipSubject;
  final BehaviorSubject<IAccount> _accountSubject;

  @override
  IPleromaAccountRelationship get accountRelationship =>
      _accountRelationshipSubject.value;

  @override
  Stream<IPleromaAccountRelationship> get accountRelationshipStream =>
      _accountRelationshipSubject.stream;

  final IPleromaAccountService pleromaAccountService;
  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final bool isNeedPreFetchRelationship;
  final bool isNeedWatchLocalRepositoryForUpdates;
  bool refreshInProgress = false;
  bool refreshAccountRelationshipInProgress = false;

  AccountBloc({
    @required this.myAccount,
    @required this.accountRepository,
    @required this.pleromaWebSocketsService,
    @required this.statusRepository,
    @required this.pleromaAccountService,
    @required
        IAccount account, // for better performance we don't update account
    // too often
    bool isNeedRefreshFromNetworkOnInit =
        false, // sometimes we don't need relationship
    this.isNeedPreFetchRelationship =
        true, // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  })  : _accountSubject = BehaviorSubject.seeded(account),
        _accountRelationshipSubject =
            BehaviorSubject.seeded(account.pleromaRelationship) {
    assert(account != null);
    // _logger.finest(() => "AccountBloc constructor ${account.remoteId}");
    addDisposable(subject: _accountSubject);
    addDisposable(subject: _accountRelationshipSubject);
    addDisposable(streamSubscription: _accountSubject.stream.listen((account) {
      var pleromaRelationship = account?.pleromaRelationship;
      // _logger.finest(() => "pleromaRelationship $pleromaRelationship");
      if (pleromaRelationship?.following != null) {
        _accountRelationshipSubject.add(pleromaRelationship);
      }
    }));
    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(account, isNeedRefreshFromNetworkOnInit);
      });
    } else {
      _init(account, isNeedRefreshFromNetworkOnInit);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // _logger.finest(() => "AccountBloc dispose");
  }

  void _init(IAccount account, bool needRefreshFromNetworkOnInit) {
    if (!disposed) {
      if (isNeedWatchLocalRepositoryForUpdates) {
        addDisposable(
            streamSubscription: accountRepository
                .watchByRemoteId(account.remoteId)
                .listen((updatedAccount) {
          if (updatedAccount != null) {
            _accountSubject.add(updatedAccount);
          }
        }));
      }

      if (needRefreshFromNetworkOnInit == true) {
        refreshFromNetwork
          (isNeedPreFetchRelationship:isNeedPreFetchRelationship);
      } else {
        if (isNeedPreFetchRelationship &&
            accountRelationship?.following == null) {
          _refreshAccountRelationship(account);
        }
      }
    }
  }

  Future _refreshAccountRelationship(IAccount account) async {
    _logger.finest(() => "refreshAccountRelationship "
        "refreshAccountRelationshipInProgress="
        "$refreshAccountRelationshipInProgress");
    if (refreshAccountRelationshipInProgress != true) {
      refreshAccountRelationshipInProgress = true;
      var relationships = await pleromaAccountService
          .getRelationshipWithAccounts(remoteAccountIds: [account.remoteId]);
      await _updateRelationship(account, relationships.first);
      refreshAccountRelationshipInProgress = false;
    }
  }

  @override
  IAccount get account => _accountSubject.value;

  @override
  Stream<IAccount> get accountStream => _accountSubject.stream.distinct();

  @override
  Stream<EmojiText> get displayNameEmojiTextStream => accountStream
      .map((account) =>
          EmojiText(text: account.displayName, emojis: account.emojis))
      .distinct();

  @override
  Future report() => pleromaAccountService.reportAccount(
      reportRequest: PleromaAccountReportRequest(accountId: account.remoteId));

  @override
  Future<IPleromaAccountRelationship> toggleBlock() async {
    assert(accountRelationship != null);
    var newRelationship;
    if (accountRelationship.blocking) {
      newRelationship = await pleromaAccountService.unBlockAccount(
          accountRemoteId: account.remoteId);
    } else {
      newRelationship = await pleromaAccountService.blockAccount(
          accountRemoteId: account.remoteId);
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  Future _updateRelationship(
      IAccount account, IPleromaAccountRelationship newRelationship) async {
    if (!_accountRelationshipSubject.isClosed) {
      _accountRelationshipSubject.add(newRelationship);
    }
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
          conversationRemoteId: null, chatRemoteId: null);
    }
  }

  @override
  Future<IPleromaAccountRelationship> toggleFollow() async {
    assert(accountRelationship != null);
    var newRelationship;
    if (accountRelationship.following == true) {
      newRelationship = await pleromaAccountService.unFollowAccount(
          accountRemoteId: account.remoteId);
      await accountRepository.updateLocalAccountByRemoteAccount(
          oldLocalAccount: account,
          newRemoteAccount: mapLocalAccountToRemoteAccount(account.copyWith(
              followersCount: account.followersCount - 1,
              pleromaRelationship: newRelationship)));

      if (myAccount != null) {
        await accountRepository.removeAccountFollower(
            accountRemoteId: account.remoteId,
            followerAccountId: myAccount.remoteId);

        await accountRepository.removeAccountFollowing(
            accountRemoteId: myAccount.remoteId,
            followingAccountId: account.remoteId);
      }

      await statusRepository.removeAccountStatusesFromHome(
          accountRemoteId: account.remoteId);
    } else {
      newRelationship = await pleromaAccountService.followAccount(
          accountRemoteId: account.remoteId);
      await accountRepository.updateLocalAccountByRemoteAccount(
          oldLocalAccount: account,
          newRemoteAccount: mapLocalAccountToRemoteAccount(account.copyWith(
              followersCount: account.followersCount + 1,
              pleromaRelationship: newRelationship)));
    }

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> toggleMute() async {
    assert(accountRelationship != null);
    var newRelationship;
    if (accountRelationship.muting == true) {
      newRelationship = await pleromaAccountService.unMuteAccount(
          accountRemoteId: account.remoteId);
    } else {
      newRelationship = await pleromaAccountService.muteAccount(
          accountRemoteId: account.remoteId);
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> togglePin() async {
    assert(accountRelationship != null);
    var newRelationship;
    // todo: fix
    if (accountRelationship.muting == true) {
      newRelationship = await pleromaAccountService.unPinAccount(
          accountRemoteId: account.remoteId);
    } else {
      newRelationship = await pleromaAccountService.pinAccount(
          accountRemoteId: account.remoteId);
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> toggleBlockDomain() async {
    assert(accountRelationship != null);
    var newRelationship;
    var domainBlocking = accountRelationship.domainBlocking == true;
    var domain = remoteDomainOrNull;
    if (domainBlocking) {
      await pleromaAccountService.unBlockDomain(domain: domain);
    } else {
      await pleromaAccountService.blockDomain(domain: domain);
    }
    newRelationship =
        accountRelationship.copyWith(domainBlocking: !domainBlocking);
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<bool> refreshFromNetwork({@required bool isNeedPreFetchRelationship}) async {
    _logger.finest(() => "requestRefreshFromNetwork start");

    IPleromaAccount remoteAccount;
    try {
      remoteAccount = await pleromaAccountService.getAccount(
          accountRemoteId: account.remoteId);
    } catch (e, stackTrace) {
      _logger.severe(
          () => "requestRefreshFromNetwork exception ", e, stackTrace);
    }

    if (remoteAccount != null) {
      if (isNeedPreFetchRelationship == true) {
        await _refreshAccountRelationship(
            mapRemoteAccountToLocalAccount(remoteAccount));
      } else {
        if (remoteAccount != null) {
          _logger.finest(
              () => "requestRefreshFromNetwork remoteAccount  $remoteAccount");

          remoteAccount = mapLocalAccountToRemoteAccount(
              mapRemoteAccountToLocalAccount(remoteAccount)
                  .copyWith(pleromaRelationship: accountRelationship));

          if (account.localId != null) {
            await accountRepository.updateLocalAccountByRemoteAccount(
                oldLocalAccount: account, newRemoteAccount: remoteAccount);
          } else {
            // sometimes we don't have local account id, for example go from search
            // to account page
            await accountRepository.upsertRemoteAccount(remoteAccount,
                conversationRemoteId: null, chatRemoteId: null);
          }
        } else {
          _logger.severe(
              () => "requestRefreshFromNetwork remoteAccount  $remoteAccount");
        }
      }
    }

    return remoteAccount != null;
  }

  static AccountBloc createFromContext(BuildContext context,
          {@required IAccount account,
          @required bool isNeedWatchWebSocketsEvents,
          @required bool isNeedRefreshFromNetworkOnInit,
          @required bool isNeedPreFetchRelationship,
          @required bool isNeedWatchLocalRepositoryForUpdates}) =>
      AccountBloc(
          isNeedPreFetchRelationship: isNeedPreFetchRelationship,
          pleromaWebSocketsService:
              IPleromaWebSocketsService.of(context, listen: false),
          statusRepository: IStatusRepository.of(context, listen: false),
          account: account,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates,
          accountRepository: IAccountRepository.of(context, listen: false),
          pleromaAccountService:
              IPleromaAccountService.of(context, listen: false),
          myAccount: IMyAccountBloc.of(context, listen: false).account);

  @override
  String get remoteDomainOrNull {
    var usernameWithAt = "${account.username}@";
    if (acct.contains(usernameWithAt)) {
      return acct.replaceAll(usernameWithAt, "");
    } else {
      return null;
    }
  }
}
