import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/account_model_adapter.dart';
import 'package:fedi/refactored/app/account/repository/account_repository.dart';
import 'package:fedi/refactored/app/emoji/emoji_text_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/refactored/pleroma/account/pleroma_account_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:moor/moor.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("account_bloc_impl.dart");

class AccountBloc extends IAccountBloc {
  final BehaviorSubject<IAccount> _accountSubject;

  IPleromaAccountRelationship get accountRelationship =>
      account.pleromaRelationship;

  @override
  Stream<IPleromaAccountRelationship> get accountRelationshipStream {
    // load from network if relationship not exist locally
    // API require additional request to retrieve relationship
    if (accountRelationship == null) {
      // don't await
      _refreshAccountRelationship(account);
    }
    return accountStream.map((account) {
      return account.pleromaRelationship;
    });
  }

  final IPleromaAccountService pleromaAccountService;
  final IAccountRepository accountRepository;
  final bool isNeedPreFetchRelationship;
  final bool isNeedWatchLocalRepositoryForUpdates;
  bool refreshInProgress = false;
  bool refreshAccountRelationshipInProgress = false;

  AccountBloc({
    @required this.accountRepository,
    @required this.pleromaAccountService,
    @required IAccount account,
    // for better performance we don't update account too often
    bool isNeedRefreshFromNetworkOnInit = false,
    // sometimes we don't need relationship
    this.isNeedPreFetchRelationship = true,
    // todo: remove hack. Don't init when bloc quickly disposed. Help
    //  improve performance in timeline unnecessary recreations
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  }) : _accountSubject = BehaviorSubject.seeded(account) {
    assert(account != null);
    _logger.finest(() => "AccountBloc ${account.remoteId}");
    addDisposable(subject: _accountSubject);
    if (delayInit) {
      Future.delayed(Duration(seconds: 1), () {
        _init(account, isNeedRefreshFromNetworkOnInit);
      });
    } else {
      _init(account, isNeedRefreshFromNetworkOnInit);
    }
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
        refreshFromNetwork();
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
  Future<IPleromaAccountRelationship> toggleFollow() async {
    assert(accountRelationship != null);
    var newRelationship;
    if (accountRelationship.following) {
      newRelationship = await pleromaAccountService.unFollowAccount(
          accountRemoteId: account.remoteId);
    } else {
      newRelationship = await pleromaAccountService.followAccount(
          accountRemoteId: account.remoteId);
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> toggleMute() async {
    assert(accountRelationship != null);
    var newRelationship;
    if (accountRelationship.muting) {
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
    if (accountRelationship.muting) {
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
  Future<bool> refreshFromNetwork() async {
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

          if (account.localId != null) {
            await accountRepository.updateLocalAccountByRemoteAccount(
                oldLocalAccount: account, newRemoteAccount: remoteAccount);
          } else {
            // sometimes we don't have local account id, for example go from search
            // to account page
            await accountRepository.upsertRemoteAccount(remoteAccount,
                conversationRemoteId: null);
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
          @required bool isNeedRefreshFromNetworkOnInit,
          @required bool isNeedWatchLocalRepositoryForUpdates}) =>
      AccountBloc(
          account: account,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          isNeedWatchLocalRepositoryForUpdates:
              isNeedWatchLocalRepositoryForUpdates,
          accountRepository: IAccountRepository.of(context, listen: false),
          pleromaAccountService:
              IPleromaAccountService.of(context, listen: false));
}
