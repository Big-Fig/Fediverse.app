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
import 'package:fedi/pleroma/api/account/auth/pleroma_api_auth_account_service.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/web_sockets/pleroma_api_web_sockets_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger('local_account_bloc_impl.dart');

class LocalAccountBloc extends AccountBloc {
  final IMyAccount? myAccount;
  final IPleromaApiAuthAccountService pleromaAuthAccountService;

  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;
  final IPleromaApiWebSocketsService pleromaWebSocketsService;
  final bool isNeedWatchLocalRepositoryForUpdates;
  final bool isNeedPreFetchRelationship;

  bool _refreshAccountRelationshipInProgress = false;

  final BehaviorSubject<IPleromaApiAccountRelationship?>
      accountRelationshipSubject;

  @override
  IPleromaApiAccountRelationship? get relationship =>
      accountRelationshipSubject.value ?? account.pleromaRelationship;

  @override
  Stream<IPleromaApiAccountRelationship?> get relationshipStream =>
      Rx.combineLatest2(
        accountRelationshipSubject.stream,
        accountStream,
        (
          IPleromaApiAccountRelationship? relationship,
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
          // _logger.finest(() => 'pleromaRelationship $pleromaRelationship');
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
            IPleromaApiWebSocketsService.of(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        account: account,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
        accountRepository: IAccountRepository.of(context, listen: false),
        pleromaAuthAccountService:
            IPleromaApiAuthAccountService.of(context, listen: false),
        myAccount: IMyAccountBloc.of(context, listen: false).myAccount,
      );


  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
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
            accountRepository.watchByRemoteIdInAppType(account.remoteId).listen(
          (updatedAccount) {
            if (updatedAccount != null) {
              accountSubject.add(updatedAccount);
            }
          },
        ),
      );
    }

    if (isNeedRefreshFromNetworkOnInit) {
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
  Future<IPleromaApiAccountRelationship> toggleBlock() async {
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
  Future<IPleromaApiAccountRelationship> toggleSubscribe() async {
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
  Future<IPleromaApiAccountRelationship> toggleMute() async {
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
  Future<IPleromaApiAccountRelationship> toggleFollow() async {
    assert(relationship != null);
    var newRelationship;
    if (relationship!.requested == true || relationship!.following == true) {
      newRelationship = await pleromaAuthAccountService.unFollowAccount(
        accountRemoteId: account.remoteId,
      );

      await accountRepository.batch((batch) {
        accountRepository.updateAppTypeByRemoteType(
          appItem: account,
          remoteItem: account
              .copyWith(
                followersCount: account.followersCount - 1,
                pleromaRelationship: newRelationship,
              )
              .toPleromaApiAccount(),
          batchTransaction: batch,
        );

        if (myAccount != null) {
          accountRepository.removeAccountFollower(
            accountRemoteId: account.remoteId,
            followerAccountId: myAccount!.remoteId,
            batchTransaction: batch,
          );

          accountRepository.removeAccountFollowing(
            accountRemoteId: myAccount!.remoteId,
            followingAccountId: account.remoteId,
            batchTransaction: batch,
          );
        }

        statusRepository.removeAccountStatusesFromHome(
          accountRemoteId: account.remoteId,
          batchTransaction: batch,
        );
      });
    } else {
      newRelationship = await pleromaAuthAccountService.followAccount(
        accountRemoteId: account.remoteId,
      );
      await accountRepository.updateAppTypeByRemoteType(
        appItem: account,
        remoteItem: account
            .copyWith(
              followersCount: account.followersCount + 1,
              pleromaRelationship: newRelationship,
            )
            .toPleromaApiAccount(),
        // dont need batch because we have only one transaction
        batchTransaction: null,
      );
    }

    return newRelationship;
  }

  @override
  Future<IPleromaApiAccountRelationship> mute({
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
  Future<IPleromaApiAccountRelationship> unMute() async {
    assert(relationship != null);
    assert(relationship!.muting == true);

    var newRelationship = await pleromaAuthAccountService.unMuteAccount(
      accountRemoteId: account.remoteId,
    );

    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IPleromaApiAccountRelationship> subscribe() async {
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
  Future<IPleromaApiAccountRelationship> unSubscribe() async {
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
  Future<IPleromaApiAccountRelationship> togglePin() async {
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
  Future<IPleromaApiAccountRelationship> toggleBlockDomain() async {
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
    IPleromaApiAccountRelationship newRelationship,
  ) async {
    if (!accountRelationshipSubject.isClosed) {
      accountRelationshipSubject.add(newRelationship);
    }
    var newAccount = account.copyWith(pleromaRelationship: newRelationship);
    var newRemoteAccount = newAccount.toPleromaApiAccount();

    _logger.finest(() => '_updateRelationship '
        'newRelationship=$newRelationship');
    _logger.finest(() => '_updateRelationship newRemoteAccount.relationship'
        '${newRemoteAccount.pleroma?.relationship}');
    if (account.localId != null) {
      await accountRepository.updateAppTypeByRemoteType(
        appItem: account,
        remoteItem: newRemoteAccount,
        // dont need batch because we have only one transaction
        batchTransaction: null,
      );
    } else {
      // sometimes we dont have local account id, for example go from search
      // to account page
      await accountRepository.upsertInRemoteType(
        newRemoteAccount,
      );
    }
  }

  Future _refreshAccountRelationship(IAccount account) async {
    _logger.finest(() => 'refreshAccountRelationship '
        'refreshAccountRelationshipInProgress='
        '$_refreshAccountRelationshipInProgress');
    if (!_refreshAccountRelationshipInProgress) {
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
    _logger.finest(() => 'requestRefreshFromNetwork start');

    var remoteAccount = await loadRemoteAccount();
    if (isNeedPreFetchRelationship) {
      await _refreshAccountRelationship(
        remoteAccount.toDbAccountWrapper(),
      );
    } else {
      _logger.finest(
        () => 'requestRefreshFromNetwork remoteAccount  $remoteAccount',
      );

      remoteAccount = remoteAccount.copyWith(
        pleroma: remoteAccount.pleroma
            ?.copyWith(
              relationship: relationship?.toPleromaApiAccountRelationship(),
            )
            .toPleromaApiAccountPleromaPart(),
      );

      if (account.localId != null) {
        await accountRepository.updateAppTypeByRemoteType(
          appItem: account,
          remoteItem: remoteAccount,
          // dont need batch because we have only one transaction
          batchTransaction: null,
        );
      } else {
        // sometimes we dont have local account id, for example go from search
        // to account page
        await accountRepository.upsertInRemoteType(
          remoteAccount,
        );
      }
    }
  }

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
