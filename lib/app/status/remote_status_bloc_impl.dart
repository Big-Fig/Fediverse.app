import 'package:collection/collection.dart' show IterableExtension;
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/instance/location/instance_location_exception.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service_impl.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class RemoteStatusBloc extends StatusBloc {
  final Uri instanceUri;

  final BehaviorSubject<IAccount> inReplyToAccountSubject = BehaviorSubject();
  final BehaviorSubject<IStatus?> inReplyToStatusSubject = BehaviorSubject();

  RemoteStatusBloc({
    required this.instanceUri,
    required IPleromaStatusService pleromaStatusService,
    required IPleromaAccountService pleromaAccountService,
    required IStatus status,
    required bool isNeedRefreshFromNetworkOnInit,
    required bool delayInit,
  }) : super(
          pleromaStatusService: pleromaStatusService,
          pleromaAccountService: pleromaAccountService,
          // todo: rework passing null to separate classes without these fields
          pleromaStatusEmojiReactionService: null,
          pleromaPollService: null,
          status: status,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        ) {
    addDisposable(subject: inReplyToAccountSubject);
    addDisposable(subject: inReplyToStatusSubject);
  }

  static RemoteStatusBloc createFromContext(
    BuildContext context, {
    required IStatus status,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

    var pleromaAccountService = PleromaAccountService(
      restService: remoteInstanceBloc.pleromaRestService,
    );
    var pleromaStatusService = PleromaStatusService(
      restService: remoteInstanceBloc.pleromaRestService,
    );

    var remoteStatusBloc = RemoteStatusBloc(
      status: status,
      isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      delayInit: delayInit,
      pleromaStatusService: pleromaStatusService,
      pleromaAccountService: pleromaAccountService,
      instanceUri: remoteInstanceBloc.instanceUri,
    );

    remoteStatusBloc.addDisposable(disposable: pleromaAccountService);
    remoteStatusBloc.addDisposable(disposable: pleromaStatusService);

    return remoteStatusBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IStatus status,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
    required Widget child,
  }) {
    return DisposableProvider<IStatusBloc>(
      create: (context) => RemoteStatusBloc.createFromContext(
        context,
        status: status,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
        delayInit: delayInit,
      ),
      child: child,
    );
  }

  @override
  Future actualInit({
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
  Future refreshFromNetwork() async {
    var remoteStatus = await loadRemoteStatus();

    statusSubject.add(
      remoteStatus.toDbStatusPopulatedWrapper(),
    );
  }

  Future _checkIsInReplyToAccountLoaded() async {
    // todo: don't load account if inReplyToStatus already loaded
    var inReplyToAccountRemoteId = status.inReplyToAccountRemoteId;
    if (inReplyToAccountRemoteId != null) {
      var remoteAccount = await pleromaAccountService.getAccount(
          accountRemoteId: inReplyToAccountRemoteId);

      inReplyToAccountSubject.add(
        remoteAccount.toDbAccountWrapper(),
      );
    }
  }

  Future _checkIsInReplyToStatusLoaded() async {
    var inReplyToRemoteId = status.inReplyToRemoteId;
    if (inReplyToRemoteId != null) {
      var remoteStatus = await pleromaStatusService.getStatus(
          statusRemoteId: inReplyToRemoteId);

      inReplyToStatusSubject.add(
        remoteStatus.toDbStatusPopulatedWrapper(),
      );
    }
  }

  @override
  Future<IAccount> getInReplyToAccount() async {
    await _checkIsInReplyToAccountLoaded();

    return inReplyToAccountSubject.value!;
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

    var account;
    if (foundMention != null) {
      var accountRemoteId = foundMention.id;
      if (pleromaAccountService.isApiReadyToUse) {
        var remoteAccount = await pleromaAccountService.getAccount(
          accountRemoteId: accountRemoteId,
        );

        account = remoteAccount.toDbAccountWrapper();
      }
    }

    return account;
  }

  @override
  Future delete() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleBookmark() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaStatus> toggleEmojiReaction({
    required String? emoji,
  }) {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleFavourite() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleMute({
    required Duration? duration,
  }) {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> togglePin() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleReblog() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;

  @override
  Future<IStatus> mute({
    required Duration? duration,
  }) {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  // todo: should be implemented
  bool get isPleroma =>
      throw UnsupportedOnRemoteInstanceLocationException();
}
