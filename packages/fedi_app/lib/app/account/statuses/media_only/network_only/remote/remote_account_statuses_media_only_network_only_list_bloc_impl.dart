import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/statuses/media_only/network_only/account_statuses_media_only_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc
    extends AccountStatusesMediaOnlyNetworkOnlyListBloc {
  final Uri instanceUri;

  RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc({
    required IAccount? account,
    required IUnifediApiAccountService unifediApiAccountService,
    required this.instanceUri,
  }) : super(
          account: account,
          unifediApiAccountService: unifediApiAccountService,
        );

  static RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required IAccount? account,
    required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var unifediApiAccountService =
        remoteInstanceBloc.unifediApiManager.createAccountService();

    var bloc = RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc(
      account: account,
      instanceUri: instanceUri,
      unifediApiAccountService: unifediApiAccountService,
    );

    unifediApiAccountService.disposeWith(bloc);

    return bloc;
  }

  static Widget provideToContext(
    BuildContext context, {
    required IAccount? account,
    required Widget child,
    required Uri instanceUri,
  }) =>
      DisposableProvider<IStatusNetworkOnlyListBloc>(
        create: (context) =>
            RemoteAccountStatusesMediaOnlyNetworkOnlyListBloc.createFromContext(
          context,
          account: account,
          instanceUri: instanceUri,
        ),
        child: ProxyProvider<IStatusNetworkOnlyListBloc, INetworkOnlyListBloc>(
          update: (context, value, previous) => value,
          child: StatusNetworkOnlyListBlocProxyProvider(
            child: ProxyProvider<IStatusNetworkOnlyListBloc,
                INetworkOnlyListBloc<IStatus>>(
              update: (context, value, previous) => value,
              child: child,
            ),
          ),
        ),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;
}
