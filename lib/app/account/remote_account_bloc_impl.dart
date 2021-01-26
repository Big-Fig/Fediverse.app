import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/account_bloc_impl.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/account_model_adapter.dart';
import 'package:fedi/app/instance/location/instance_location_exception.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/account/pleroma_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_service_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final Logger _logger = Logger("remote_account_bloc_impl.dart");

class RemoteAccountBloc extends AccountBloc {
  final Uri instanceUri;

  RemoteAccountBloc({
    @required IPleromaAccountService pleromaAccountService,
    @required IAccount account,
    @required this.instanceUri,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
  }) : super(
          pleromaAccountService: pleromaAccountService,
          account: account,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        );

  static RemoteAccountBloc createFromContext(
    BuildContext context, {
    @required IAccount account,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

    var pleromaAccountService = PleromaAccountService(
      restService: remoteInstanceBloc.pleromaRestService,
    );

    var remoteAccountBloc = RemoteAccountBloc(
      account: account,
      isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      pleromaAccountService: pleromaAccountService,
      instanceUri: remoteInstanceBloc.instanceUri,
    );

    remoteAccountBloc.addDisposable(disposable: pleromaAccountService);

    return remoteAccountBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    @required IAccount account,
    @required bool isNeedRefreshFromNetworkOnInit,
    @required Widget child,
  }) {
    return DisposableProvider<IAccountBloc>(
      create: (context) => RemoteAccountBloc.createFromContext(
        context,
        account: account,
        isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      ),
      child: child,
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;

  @override
  Future actualInit({
    @required IAccount account,
    @required bool isNeedRefreshFromNetworkOnInit,
  }) async {
    if (isNeedRefreshFromNetworkOnInit == true) {
      await refreshFromNetwork(isNeedPreFetchRelationship: false);
    }
  }

  @override
  Future<bool> refreshFromNetwork({
    @required bool isNeedPreFetchRelationship,
  }) async {
    _logger.finest(() => "requestRefreshFromNetwork start");

    var remoteAccount = await loadRemoteAccount();

    if (remoteAccount != null) {
      accountSubject.add(
        mapRemoteAccountToLocalAccount(
          remoteAccount,
        ),
      );
    }

    return remoteAccount != null;
  }

  @override
  Future<IPleromaAccountRelationship> mute({@required bool notifications}) {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaAccountRelationship> subscribe() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaAccountRelationship> toggleBlock() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaAccountRelationship> toggleBlockDomain() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaAccountRelationship> toggleFollow() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaAccountRelationship> toggleMute() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaAccountRelationship> togglePin() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaAccountRelationship> toggleSubscribe() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaAccountRelationship> unMute() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IPleromaAccountRelationship> unSubscribe() {
    throw UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  IPleromaAccountRelationship get relationship =>
      throw UnsupportedOnRemoteInstanceLocationException();

  @override
  Stream<IPleromaAccountRelationship> get relationshipStream =>
      throw UnsupportedOnRemoteInstanceLocationException();
}
