import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/account_bloc_impl.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/account_model_adapter.dart';
import 'package:fedi_app/app/instance/location/instance_location_exception.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final Logger _logger = Logger('remote_account_bloc_impl.dart');

class RemoteAccountBloc extends AccountBloc {
  final Uri? instanceUri;

  RemoteAccountBloc({
    required IUnifediApiAccountService? unifediApiAccountService,
    required IAccount account,
    required this.instanceUri,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
  }) : super(
          unifediApiAccountService: unifediApiAccountService,
          account: account,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
          delayInit: delayInit,
        );

  static RemoteAccountBloc createFromContext(
    BuildContext context, {
    required IAccount account,
    bool isNeedRefreshFromNetworkOnInit = false,
    bool delayInit = true,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);

    var unifediApiAccountService =
        remoteInstanceBloc.unifediApiManager.createAccountService();

    var remoteAccountBloc = RemoteAccountBloc(
      account: account,
      isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
      unifediApiAccountService: unifediApiAccountService,
      instanceUri: remoteInstanceBloc.instanceUri,
    );

    unifediApiAccountService.disposeWith(remoteAccountBloc);

    return remoteAccountBloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IAccount account,
    required bool isNeedRefreshFromNetworkOnInit,
    required Widget child,
  }) =>
      DisposableProvider<IAccountBloc>(
        create: (context) => RemoteAccountBloc.createFromContext(
          context,
          account: account,
          isNeedRefreshFromNetworkOnInit: isNeedRefreshFromNetworkOnInit,
        ),
        child: child,
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri? get remoteInstanceUriOrNull => instanceUri;

  @override
  Future<void> actualInit({
    required IAccount account,
    required bool isNeedRefreshFromNetworkOnInit,
  }) async {
    if (isNeedRefreshFromNetworkOnInit) {
      await refreshFromNetwork(isNeedPreFetchRelationship: false);
    }
  }

  @override
  Future<void> refreshFromNetwork({
    required bool isNeedPreFetchRelationship,
  }) async {
    _logger.finest(() => 'requestRefreshFromNetwork start');

    var remoteAccount = await loadRemoteAccount();

    accountSubject.add(
      remoteAccount.toDbAccountWrapper(),
    );
  }

  @override
  Future<IUnifediApiAccountRelationship> mute({
    required bool notifications,
    required Duration? duration,
  }) {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiAccountRelationship> subscribe() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleBlock() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleBlockDomain() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleFollow() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleMute() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiAccountRelationship> togglePin() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiAccountRelationship> toggleSubscribe() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiAccountRelationship> unMute() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  Future<IUnifediApiAccountRelationship> unSubscribe() {
    throw const UnsupportedOnRemoteInstanceLocationException();
  }

  @override
  IUnifediApiAccountRelationship? get relationship => null;

  @override
  Stream<IUnifediApiAccountRelationship>? get relationshipStream => null;

  @override
  bool get isEndorsementSupported => false;

  @override
  bool get isSubscribeToAccountFeatureSupported => false;
}
