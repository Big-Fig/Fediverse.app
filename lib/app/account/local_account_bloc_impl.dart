import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/app/account/repository/account_repository.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/pleroma/account/auth/pleroma_auth_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/web_sockets/pleroma_web_sockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("local_account_bloc_impl.dart");

class LocalAccountBloc extends AccountBloc {
  final IMyAccount? myAccount;
  final IPleromaAuthAccountService pleromaAuthAccountService;

  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;
  final IPleromaWebSocketsService pleromaWebSocketsService;
  final bool isNeedWatchLocalRepositoryForUpdates;
  final bool isNeedPreFetchRelationship;

  bool _refreshAccountRelationshipInProgress = false;

  final BehaviorSubject<IPleromaAccountRelationship?>
      accountRelationshipSubject;

  @override
  IPleromaAccountRelationship? get relationship =>
      accountRelationshipSubject.value ?? account.pleromaRelationship;

  @override
  Stream<IPleromaAccountRelationship?> get relationshipStream =>
      Rx.combineLatest2(
        accountRelationshipSubject.stream,
        accountStream,
        (
          IPleromaAccountRelationship? relationship,
          IAccount? account,
        ) =>
            relationship ?? account?.pleromaRelationship,
      );

  LocalAccountBloc({
    required this.pleromaWebSocketsService,
    required this.myAccount,
    required this.accountRepository,
    required this.statusRepository,
    required this.pleromaAuthAccountService,
    required IAccount account,
    bool isNeedRefreshFromNetworkOnInit = false,
    this.isNeedPreFetchRelationship = true,
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  })  : accountRelationshipSubject =
            BehaviorSubject.seeded(account.pleromaRelationship),
        super(
          pleromaAccountService: pleromaAuthAccountService,
          account: account,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        ) {
    addDisposable(subject: accountRelationshipSubject);
    addDisposable(
      streamSubscription: accountSubject.stream.listen(
        (account) {
          var pleromaRelationship = account.pleromaRelationship;
          // _logger.finest(() => "pleromaRelationship $pleromaRelationship");
          if (pleromaRelationship?.following != null) {
            accountRelationshipSubject.add(pleromaRelationship);
          }
        },
      ),
    );
  }

  static LocalAccountBloc createFromContext(
    BuildContext context, {
    required IAccount account,
    required bool isNeedWatchWebSocketsEvents,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool isNeedPreFetchRelationship,
    required bool isNeedWatchLocalRepositoryForUpdates,
  }) =>
      LocalAccountBloc(
        isNeedPreFetchRelationship: isNeedPreFetchRelationship,
        pleromaWebSocketsService:
            IPleromaWebSocketsService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        account: account,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
        accountRepository: IAccountRepository.of(context, listen: false),
        pleromaAuthAccountService:
            IPleromaAuthAccountService.of(context, listen: false),
        myAccount: IMyAccountBloc.of(context, listen: false).myAccount,
      );

  static Widget provideToContext(
    BuildContext context, {
    required IAccount account,
    required bool isNeedWatchWebSocketsEvents,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool isNeedPreFetchRelationship,
    required bool isNeedWatchLocalRepositoryForUpdates,
    required Widget child,
  }) {
    return DisposableProvider<IAccountBloc>(
      create: (context) => LocalAccountBloc.createFromContext(
        context,
        account: account,
        isNeedWatchWebSocketsEvents: isNeedWatchWebSocketsEvents,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
        isNeedPreFetchRelationship: isNeedPreFetchRelationship,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
      ),
      child: child,
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Future actualInit({
    required IAccount account,
    required bool isNeedRefreshFromNetworkOnInit,
  }) async {
    if (isNeedWatchLocalRepositoryForUpdates) {
      addDisposable(
        streamSubscription:
            accountRepository.watchByRemoteId(account.remoteId).listen(
          (updatedAccount) {
            if (updatedAccount != null) {
              accountSubject.add(updatedAccount);
            }
          },
        ),
      );
    }

    if (isNeedRefreshFromNetworkOnInit == true) {
      await refreshFromNetwork(
        isNeedPreFetchRelationship: isNeedPreFetchRelationship,
      );
    } else {
      if (isNeedPreFetchRelationship && relationship?.following == null) {
        await _refreshAccountRelationship(account);
      }
    }
  }

  @override
  Future<IPleromaAccountRelationship> toggleBlock() async {
    assert(relationship != null);
    var newRelationship;
    if (relationship!.blocking!) {
      newRelationship = await pleromaAuthAccountService.unBlockAccount(
        accountRemoteId: account.remoteId,
      );
    } else {
      newRelationship = await pleromaAuthAccountService.blockAccount(
        accountRemoteId: account.remoteId,
      );
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> toggleSubscribe() async {
    assert(relationship != null);
    var newRelationship;
    if (relationship!.subscribing!) {
      newRelationship = await pleromaAuthAccountService.unSubscribeAccount(
        accountRemoteId: account.remoteId,
      );
    } else {
      newRelationship = await pleromaAuthAccountService.subscribeAccount(
        accountRemoteId: account.remoteId,
      );
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> toggleMute() async {
    assert(relationship != null);
    var newRelationship;
    if (relationship!.muting!) {
      newRelationship = await pleromaAuthAccountService.unMuteAccount(
        accountRemoteId: account.remoteId,
      );
    } else {
      newRelationship = await pleromaAuthAccountService.muteAccount(
        accountRemoteId: account.remoteId,
        notifications: false,
        expireDurationInSeconds: null,
      );
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> toggleFollow() async {
    assert(relationship != null);
    var newRelationship;
    if (relationship!.requested == true || relationship!.following == true) {
      newRelationship = await pleromaAuthAccountService.unFollowAccount(
        accountRemoteId: account.remoteId,
      );
      await accountRepository.updateLocalAccountByRemoteAccount(
        oldLocalAccount: account,
        newRemoteAccount: account
            .copyWith(
              followersCount: account.followersCount - 1,
              pleromaRelationship: newRelationship,
            )
            .toPleromaAccount(),
      );

      if (myAccount != null) {
        await accountRepository.removeAccountFollower(
          accountRemoteId: account.remoteId,
          followerAccountId: account.remoteId,
        );

        await accountRepository.removeAccountFollowing(
          accountRemoteId: account.remoteId,
          followingAccountId: account.remoteId,
        );
      }

      await statusRepository.removeAccountStatusesFromHome(
        accountRemoteId: account.remoteId,
      );
    } else {
      newRelationship = await pleromaAuthAccountService.followAccount(
        accountRemoteId: account.remoteId,
      );
      await accountRepository.updateLocalAccountByRemoteAccount(
        oldLocalAccount: account,
        newRemoteAccount: account
            .copyWith(
              followersCount: account.followersCount + 1,
              pleromaRelationship: newRelationship,
            )
            .toPleromaAccount(),
      );
    }

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> mute({
    required bool notifications,
    required Duration? duration,
  }) async {
    assert(relationship != null);
    assert(relationship!.muting != true);

    var newRelationship = await pleromaAuthAccountService.muteAccount(
      accountRemoteId: account.remoteId,
      notifications: notifications,
      expireDurationInSeconds: duration?.totalSeconds,
    );

    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> unMute() async {
    assert(relationship != null);
    assert(relationship!.muting == true);

    var newRelationship = await pleromaAuthAccountService.unMuteAccount(
      accountRemoteId: account.remoteId,
    );

    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> subscribe() async {
    assert(relationship != null);
    assert(relationship!.subscribing != true);

    var newRelationship = await pleromaAuthAccountService.subscribeAccount(
      accountRemoteId: account.remoteId,
    );

    await _updateRelationship(
      account,
      newRelationship,
    );

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> unSubscribe() async {
    assert(relationship != null);
    assert(relationship!.subscribing == true);

    var newRelationship = await pleromaAuthAccountService.unSubscribeAccount(
      accountRemoteId: account.remoteId,
    );

    await _updateRelationship(
      account,
      newRelationship,
    );

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> togglePin() async {
    assert(relationship != null);
    var newRelationship;
    // todo: fix
    if (relationship!.muting == true) {
      newRelationship = await pleromaAuthAccountService.unPinAccount(
        accountRemoteId: account.remoteId,
      );
    } else {
      newRelationship = await pleromaAuthAccountService.pinAccount(
        accountRemoteId: account.remoteId,
      );
    }
    await _updateRelationship(
      account,
      newRelationship,
    );

    return newRelationship;
  }

  @override
  Future<IPleromaAccountRelationship> toggleBlockDomain() async {
    assert(relationship != null);
    var newRelationship;
    var domainBlocking = relationship!.domainBlocking == true;
    var domain = acctRemoteDomainOrNull!;
    if (domainBlocking) {
      await pleromaAuthAccountService.unBlockDomain(
        domain: domain,
      );
    } else {
      await pleromaAuthAccountService.blockDomain(
        domain: domain,
      );
    }
    newRelationship = relationship!.copyWith(
      domainBlocking: !domainBlocking,
    );
    await _updateRelationship(
      account,
      newRelationship,
    );

    return newRelationship;
  }

  Future _updateRelationship(
    IAccount account,
    IPleromaAccountRelationship newRelationship,
  ) async {
    if (!accountRelationshipSubject.isClosed) {
      accountRelationshipSubject.add(newRelationship);
    }
    var newAccount = account.copyWith(pleromaRelationship: newRelationship);
    var newRemoteAccount = newAccount.toPleromaAccount();

    _logger.finest(() => "_updateRelationship "
        "newRelationship=$newRelationship");
    _logger.finest(() => "_updateRelationship newRemoteAccount.relationship"
        "${newRemoteAccount.pleroma?.relationship}");
    if (account.localId != null) {
      await accountRepository.updateLocalAccountByRemoteAccount(
        oldLocalAccount: account,
        newRemoteAccount: newRemoteAccount,
      );
    } else {
      // sometimes we don't have local account id, for example go from search
      // to account page
      await accountRepository.upsertRemoteAccount(
        newRemoteAccount,
        conversationRemoteId: null,
        chatRemoteId: null,
      );
    }
  }

  Future _refreshAccountRelationship(IAccount account) async {
    _logger.finest(() => "refreshAccountRelationship "
        "refreshAccountRelationshipInProgress="
        "$_refreshAccountRelationshipInProgress");
    if (_refreshAccountRelationshipInProgress != true) {
      _refreshAccountRelationshipInProgress = true;
      var relationships =
          await pleromaAuthAccountService.getRelationshipWithAccounts(
        remoteAccountIds: [
          account.remoteId,
        ],
      );
      await _updateRelationship(account, relationships.first);
      _refreshAccountRelationshipInProgress = false;
    }
  }

  @override
  Future refreshFromNetwork({
    required bool isNeedPreFetchRelationship,
  }) async {
    _logger.finest(() => "requestRefreshFromNetwork start");

    var remoteAccount = await loadRemoteAccount();
    if (isNeedPreFetchRelationship == true) {
      await _refreshAccountRelationship(
        remoteAccount.toDbAccountWrapper(),
      );
    } else {
      _logger.finest(
        () => "requestRefreshFromNetwork remoteAccount  $remoteAccount",
      );

      remoteAccount = remoteAccount.copyWith(
        pleroma: remoteAccount.pleroma
            ?.copyWith(
              relationship: relationship?.toPleromaAccountRelationship(),
            )
            .toPleromaAccountPleromaPart(),
      );

      if (account.localId != null) {
        await accountRepository.updateLocalAccountByRemoteAccount(
          oldLocalAccount: account,
          newRemoteAccount: remoteAccount,
        );
      } else {
        // sometimes we don't have local account id, for example go from search
        // to account page
        await accountRepository.upsertRemoteAccount(
          remoteAccount,
          conversationRemoteId: null,
          chatRemoteId: null,
        );
      }
    }
  }

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
