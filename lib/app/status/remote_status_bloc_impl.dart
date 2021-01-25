import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/instance/location/instance_location_exception.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/status/status_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service_impl.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/pleroma/status/pleroma_status_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_service_impl.dart';
import 'package:flutter/widgets.dart';

class RemoteStatusBloc extends StatusBloc {
  RemoteStatusBloc({
    @required IPleromaStatusService pleromaStatusService,
    @required IPleromaAccountService pleromaAccountService,
    @required IStatus status,
    @required bool isNeedRefreshFromNetworkOnInit,
    @required bool delayInit,
  }) : super(
          pleromaAuthStatusService: pleromaStatusService,
          pleromaAccountService: pleromaAccountService,
          // todo: rework passing null to separate classes without these fields
          pleromaStatusEmojiReactionService: null,
          pleromaPollService: null,
          status: status,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        );

  static RemoteStatusBloc createFromContext(
    BuildContext context, {
    @required IStatus status,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
  }) {
    var remoteHost = status.account.acctRemoteHost;

    // todo: refactor https
    var instanceUri = Uri.parse("https://$remoteHost");

    var remoteInstanceBloc = RemoteInstanceBloc(
      instanceUri: instanceUri,
      connectionService: IConnectionService.of(
        context,
        listen: false,
      ),
    );

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
    );

    remoteStatusBloc.addDisposable(disposable: pleromaAccountService);
    remoteStatusBloc.addDisposable(disposable: pleromaStatusService);
    remoteStatusBloc.addDisposable(disposable: remoteInstanceBloc);

    return remoteStatusBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    @required IStatus status,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
    @required Widget child,
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
    @required IStatus status,
    @required bool isNeedRefreshFromNetworkOnInit,
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
      mapRemoteStatusToLocalStatus(
        remoteStatus,
      ),
    );
  }

  @override
  Future<IAccount> getInReplyToAccount() {
    // TODO: implement getInReplyToAccount
    throw UnimplementedError();
  }

  @override
  Future<IStatus> getInReplyToStatus() {
    // TODO: implement getInReplyToStatus
    throw UnimplementedError();
  }

  @override
  Future<IAccount> loadAccountByMentionUrl({String url}) {
    // TODO: implement loadAccountByMentionUrl
    throw UnimplementedError();
  }

  @override
  Stream<IAccount> watchInReplyToAccount() {
    // TODO: implement watchInReplyToAccount
    throw UnimplementedError();
  }

  @override
  Stream<IStatus> watchInReplyToStatus() {
    // TODO: implement watchInReplyToStatus
    throw UnimplementedError();
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
    @required String emoji,
  }) {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleFavourite() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IStatus> toggleMute() {
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
}
