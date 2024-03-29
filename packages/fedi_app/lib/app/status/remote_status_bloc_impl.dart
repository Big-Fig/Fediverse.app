import 'package:collection/collection.dart' show IterableExtension;
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/instance/location/instance_location_exception.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:fedi_app/app/status/status_bloc_impl.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/status/status_model_adapter.dart';
import 'package:fedi_app/connection/connection_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RemoteStatusBloc extends StatusBloc {
  final Uri instanceUri;

  final BehaviorSubject<IAccount> inReplyToAccountSubject = BehaviorSubject();
  final BehaviorSubject<IStatus?> inReplyToStatusSubject = BehaviorSubject();
  final IConnectionService connectionService;

  RemoteStatusBloc({
    required this.instanceUri,
    required IUnifediApiStatusService unifediApiStatusService,
    required IUnifediApiPollService unifediApiPollService,
    required IUnifediApiAccountService unifediApiAccountService,
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool delayInit,
    required this.connectionService,
  }) : super(
          unifediApiStatusService: unifediApiStatusService,
          unifediApiAccountService: unifediApiAccountService,
          unifediApiPollService: unifediApiPollService,
          status: status,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        ) {
    inReplyToAccountSubject.disposeWith(this);
    inReplyToStatusSubject.disposeWith(this);
  }

  static RemoteStatusBloc createFromContext(
    BuildContext context, {
    required IStatus status,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

    var unifediApiAccountService =
        remoteInstanceBloc.unifediApiManager.createAccountService();
    var unifediApiStatusService =
        remoteInstanceBloc.unifediApiManager.createStatusService();

    var remoteStatusBloc = RemoteStatusBloc(
      status: status,
      connectionService:
          Provider.of<IConnectionService>(context, listen: false),
      isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      delayInit: delayInit,
      unifediApiPollService:
          remoteInstanceBloc.unifediApiManager.createPollService(),
      unifediApiStatusService: unifediApiStatusService,
      unifediApiAccountService: unifediApiAccountService,
      instanceUri: remoteInstanceBloc.instanceUri,
    );

    // ignore: cascade_invocations
    remoteStatusBloc
      ..addDisposable(unifediApiAccountService)
      ..addDisposable(unifediApiStatusService);

    return remoteStatusBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IStatus status,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
    required Widget child,
  }) =>
      DisposableProvider<IStatusBloc>(
        create: (context) => RemoteStatusBloc.createFromContext(
          context,
          status: status,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        ),
        child: child,
      );

  @override
  Future<void> actualInit({
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
  }) async {
    if (isNeedRefreshFromNetworkOnInit) {
      await refreshFromNetwork();
    }
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Future<void> refreshFromNetwork() async {
    var remoteStatus = await loadRemoteStatus();

    statusSubject.add(
      remoteStatus.toDbStatusPopulatedWrapper(),
    );
  }

  Future<void> _checkIsInReplyToAccountLoaded() async {
    // todo: don't load account if inReplyToStatus already loaded
    var inReplyToAccountRemoteId = status.inReplyToAccountRemoteId;
    if (inReplyToAccountRemoteId != null) {
      var remoteAccount = await unifediApiAccountService.getAccount(
        accountId: inReplyToAccountRemoteId,
        withRelationship: null,
      );

      if (!inReplyToAccountSubject.isClosed) {
        inReplyToAccountSubject.add(
          remoteAccount.toDbAccountWrapper(),
        );
      }
    }
  }

  Future<void> _checkIsInReplyToStatusLoaded() async {
    var inReplyToRemoteId = status.inReplyToRemoteId;
    if (inReplyToRemoteId != null) {
      var remoteStatus = await unifediApiStatusService.getStatus(
        statusId: inReplyToRemoteId,
      );

      inReplyToStatusSubject.add(
        remoteStatus.toDbStatusPopulatedWrapper(),
      );
    }
  }

  @override
  Future<IAccount> getInReplyToAccount() async {
    await _checkIsInReplyToAccountLoaded();

    return inReplyToAccountSubject.value;
  }

  @override
  Stream<IAccount> watchInReplyToAccount() {
    _checkIsInReplyToAccountLoaded();

    return inReplyToAccountSubject.stream;
  }

  @override
  Future<IStatus> getInReplyToStatus() async {
    await _checkIsInReplyToStatusLoaded();

    return inReplyToStatusSubject.value!;
  }

  @override
  Stream<IStatus?> watchInReplyToStatus() {
    _checkIsInReplyToStatusLoaded();

    return inReplyToStatusSubject.stream;
  }

  @override
  Future<IAccount?> loadAccountByMentionUrl({
    required String? url,
  }) async {
    var foundMention = reblogOrOriginalMentions?.firstWhereOrNull(
      (mention) => mention.url == url,
    );

    IAccount? account;
    if (foundMention != null) {
      var accountRemoteId = foundMention.id;

      if (connectionService.isConnected) {
        var remoteAccount = await unifediApiAccountService.getAccount(
          accountId: accountRemoteId,
          withRelationship: null,
        );

        account = remoteAccount.toDbAccountWrapper();
      }
    }

    return account;
  }

  @override
  Future<void> delete() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleBookmark() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiStatus> toggleEmojiReaction({
    required String? emoji,
  }) {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleFavourite() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleMute({
    required Duration? duration,
  }) {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> togglePin() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleReblog() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;

  @override
  Future<IStatus> mute({
    required Duration? duration,
  }) {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }
}
