import 'package:collection/collection.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_bloc_impl.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:fedi_app/app/account/my/my_account_model.dart';
import 'package:fedi_app/app/account/repository/account_repository.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

var _logger = Logger('local_account_bloc_impl.dart');

class LocalAccountBloc extends AccountBloc {
  final IMyAccount? myAccount;
  final IUnifediApiAccountService unifediAuthAccountService;

  final IAccountRepository accountRepository;
  final IStatusRepository statusRepository;
  final IUnifediApiWebSocketsService unifediApiWebSocketsService;
  final bool isNeedWatchLocalRepositoryForUpdates;
  final bool isNeedPreFetchRelationship;

  bool _refreshAccountRelationshipInProgress = false;

  final BehaviorSubject<IUnifediApiAccountRelationship?>
      accountRelationshipSubject;

  @override
  IUnifediApiAccountRelationship? get relationship =>
      accountRelationshipSubject.value ?? account.relationship;

  @override
  Stream<IUnifediApiAccountRelationship?> get relationshipStream =>
      Rx.combineLatest2(
        accountRelationshipSubject.stream,
        accountStream,
        (
          IUnifediApiAccountRelationship? relationship,
          IAccount? account,
        ) =>
            relationship ?? account?.relationship,
      );

  LocalAccountBloc({
    required this.unifediApiWebSocketsService,
    required this.myAccount,
    required this.accountRepository,
    required this.statusRepository,
    required this.unifediAuthAccountService,
    required IAccount account,
    bool isNeedRefreshFromNetworkOnInit = false,
    this.isNeedPreFetchRelationship = true,
    bool delayInit = true,
    this.isNeedWatchLocalRepositoryForUpdates = true,
  })  : accountRelationshipSubject =
            BehaviorSubject.seeded(account.relationship),
        super(
          unifediApiAccountService: unifediAuthAccountService,
          account: account,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        ) {
    accountRelationshipSubject.disposeWith(this);
    accountSubject.stream.listen(
      (account) {
        var relationship = account.relationship;
        // _logger.finest(() => 'relationship $relationship');
        if (relationship?.following != null) {
          accountRelationshipSubject.add(relationship);
        }
      },
    ).disposeWith(this);
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
        unifediApiWebSocketsService:
            Provider.of<IUnifediApiWebSocketsService>(context, listen: false),
        statusRepository: IStatusRepository.of(context, listen: false),
        account: account,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
        isNeedWatchLocalRepositoryForUpdates:
            isNeedWatchLocalRepositoryForUpdates,
        accountRepository: IAccountRepository.of(context, listen: false),
        unifediAuthAccountService:
            Provider.of<IUnifediApiAccountService>(context, listen: false),
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
  }) =>
      DisposableProvider<IAccountBloc>(
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

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Future<void> actualInit({
    required IAccount account,
    required bool isNeedRefreshFromNetworkOnInit,
  }) async {
    if (isNeedWatchLocalRepositoryForUpdates) {
      accountRepository.watchByRemoteIdInAppType(account.remoteId).listen(
        (updatedAccount) {
          if (updatedAccount != null) {
            accountSubject.add(updatedAccount);
          }
        },
      ).disposeWith(this);
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
  Future<IUnifediApiAccountRelationship> toggleBlock() async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    IUnifediApiAccountRelationship? newRelationship;
    if (relationship!.blocking!) {
      newRelationship = await unifediAuthAccountService.unBlockAccount(
        accountId: account.remoteId,
      );
    } else {
      newRelationship = await unifediAuthAccountService.blockAccount(
        accountId: account.remoteId,
      );
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleSubscribe() async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    IUnifediApiAccountRelationship? newRelationship;
    if (relationship!.subscribing!) {
      newRelationship = await unifediAuthAccountService.unSubscribeAccount(
        accountId: account.remoteId,
      );
    } else {
      newRelationship = await unifediAuthAccountService.subscribeAccount(
        accountId: account.remoteId,
      );
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleMute() async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    IUnifediApiAccountRelationship? newRelationship;
    if (relationship!.muting!) {
      newRelationship = await unifediAuthAccountService.unMuteAccount(
        accountId: account.remoteId,
      );
    } else {
      newRelationship = await unifediAuthAccountService.muteAccount(
        accountId: account.remoteId,
        notifications: false,
        expireIn: null,
      );
    }
    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleFollow() async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    IUnifediApiAccountRelationship? newRelationship;
    if (relationship!.requested == true || relationship!.following == true) {
      newRelationship = await unifediAuthAccountService.unFollowAccount(
        accountId: account.remoteId,
      );

      await accountRepository.batch((batch) {
        accountRepository.updateAppTypeByRemoteType(
          appItem: account,
          remoteItem: account
              .copyWithTemp(
                followersCount: account.followersCount! - 1,
                relationship: newRelationship,
              )
              .toUnifediApiAccount(),
          batchTransaction: batch,
        );

        if (myAccount != null) {
          accountRepository
            ..removeAccountFollower(
              accountRemoteId: account.remoteId,
              followerAccountId: myAccount!.remoteId,
              batchTransaction: batch,
            )
            ..removeAccountFollowing(
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
      newRelationship = await unifediAuthAccountService.followAccount(
        accountId: account.remoteId,
        notify: null,
        reblogs: null,
      );
      await accountRepository.updateAppTypeByRemoteType(
        appItem: account,
        remoteItem: account
            .copyWithTemp(
              followersCount: account.followersCount! + 1,
              relationship: newRelationship,
            )
            .toUnifediApiAccount(),
        // dont need batch because we have only one transaction
        batchTransaction: null,
      );
    }

    return newRelationship;
  }

  @override
  Future<IUnifediApiAccountRelationship> mute({
    required bool notifications,
    required Duration? duration,
  }) async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    assert(relationship!.muting != true, 'cant mute if already muted');

    var newRelationship = await unifediAuthAccountService.muteAccount(
      accountId: account.remoteId,
      notifications: notifications,
      expireIn: duration,
    );

    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IUnifediApiAccountRelationship> unMute() async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    assert(relationship!.muting == true, 'cant unmute when not muted yet');

    var newRelationship = await unifediAuthAccountService.unMuteAccount(
      accountId: account.remoteId,
    );

    await _updateRelationship(account, newRelationship);

    return newRelationship;
  }

  @override
  Future<IUnifediApiAccountRelationship> subscribe() async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    assert(
      relationship!.subscribing != true,
      'cant subscribe if already subscribed',
    );

    var newRelationship = await unifediAuthAccountService.subscribeAccount(
      accountId: account.remoteId,
    );

    await _updateRelationship(
      account,
      newRelationship,
    );

    return newRelationship;
  }

  @override
  Future<IUnifediApiAccountRelationship> unSubscribe() async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    assert(
      relationship!.subscribing == true,
      'cant unsubscribe when not subscribed',
    );

    var newRelationship = await unifediAuthAccountService.unSubscribeAccount(
      accountId: account.remoteId,
    );

    await _updateRelationship(
      account,
      newRelationship,
    );

    return newRelationship;
  }

  @override
  Future<IUnifediApiAccountRelationship> togglePin() async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    IUnifediApiAccountRelationship? newRelationship;
    // todo: fix
    if (relationship!.muting == true) {
      newRelationship = await unifediAuthAccountService.unPinAccount(
        accountId: account.remoteId,
      );
    } else {
      newRelationship = await unifediAuthAccountService.pinAccount(
        accountId: account.remoteId,
      );
    }
    await _updateRelationship(
      account,
      newRelationship,
    );

    return newRelationship;
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleBlockDomain() async {
    assert(
      relationship != null,
      'cant toggle action when relationship not loaded',
    );
    IUnifediApiAccountRelationship? newRelationship;
    var domainBlocking = relationship!.domainBlocking == true;
    var domain = acctRemoteDomainOrNull!;
    if (domainBlocking) {
      await unifediAuthAccountService.unBlockDomain(
        domain: domain,
      );
    } else {
      await unifediAuthAccountService.blockDomain(
        domain: domain,
      );
    }
    newRelationship = relationship!.toUnifediApiAccountRelationship().copyWith(
          domainBlocking: !domainBlocking,
        );
    await _updateRelationship(
      account,
      newRelationship,
    );

    return newRelationship;
  }

  Future<void> _updateRelationship(
    IAccount account,
    IUnifediApiAccountRelationship newRelationship,
  ) async {
    if (!accountRelationshipSubject.isClosed) {
      accountRelationshipSubject.add(newRelationship);
    }
    var newAccount = account.copyWithTemp(relationship: newRelationship);
    var newRemoteAccount = newAccount.toUnifediApiAccount();

    _logger.finest(
      () => '_updateRelationship '
          'newRelationship=$newRelationship',
    );
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
      // ignore: avoid-ignoring-return-values
      await accountRepository.upsertInRemoteType(
        newRemoteAccount,
      );
    }
  }

  Future<void> _refreshAccountRelationship(IAccount account) async {
    _logger.finest(
      () => 'refreshAccountRelationship '
          'refreshAccountRelationshipInProgress='
          '$_refreshAccountRelationshipInProgress',
    );
    if (!_refreshAccountRelationshipInProgress) {
      _refreshAccountRelationshipInProgress = true;
      var relationships =
          await unifediAuthAccountService.getRelationshipWithAccounts(
        accountIds: [
          account.remoteId,
        ],
      );

      var relationship = relationships.firstOrNull;

      if (relationship != null) {
        await _updateRelationship(account, relationship);
      }
      _refreshAccountRelationshipInProgress = false;
    }
  }

  @override
  Future<void> refreshFromNetwork({
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

      remoteAccount = remoteAccount
          .toUnifediApiAccount()
          .copyWith(
            relationship: relationship?.toUnifediApiAccountRelationship(),
          )
          .toUnifediApiAccount();

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
        // ignore: avoid-ignoring-return-values
        await accountRepository.upsertInRemoteType(
          remoteAccount,
        );
      }
    }
  }

  @override
  Uri? get remoteInstanceUriOrNull => null;

  @override
  bool get isEndorsementSupported =>
      unifediAuthAccountService.isFeatureSupported(
        unifediAuthAccountService.pinAccountFeature,
      );

  @override
  bool get isSubscribeToAccountFeatureSupported =>
      unifediAuthAccountService.isFeatureSupported(
        unifediAuthAccountService.subscribeAccountFeature,
      );
}
