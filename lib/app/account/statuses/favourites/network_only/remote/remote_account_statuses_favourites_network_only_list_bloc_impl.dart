import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/favourites/network_only/account_statuses_favourites_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RemoteAccountStatusesFavouritesNetworkOnlyListBloc
    extends AccountStatusesFavouritesNetworkOnlyListBloc {
  final Uri instanceUri;

  RemoteAccountStatusesFavouritesNetworkOnlyListBloc({
    required IAccount? account,
    required IUnifediApiAccountService unifediApiAccountService,
    required this.instanceUri,
  }) : super(
          account: account,
          unifediApiAccountService: unifediApiAccountService,
        );

  static RemoteAccountStatusesFavouritesNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required IAccount? account,
    required Uri instanceUri,
  }) {
    var remoteInstanceBloc = IRemoteInstanceBloc.of(context, listen: false);
    var unifediApiAccountService = remoteInstanceBloc.unifediApiManager.createAccountService();

    var bloc = RemoteAccountStatusesFavouritesNetworkOnlyListBloc(
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
  }) {
    return DisposableProvider<IStatusNetworkOnlyListBloc>(
      create: (context) =>
          RemoteAccountStatusesFavouritesNetworkOnlyListBloc.createFromContext(
        context,
        account: account,
        instanceUri: instanceUri,
      ),
      child: StatusNetworkOnlyListBlocProxyProvider(
        child: ProxyProvider<IStatusNetworkOnlyListBloc, INetworkOnlyListBloc>(
          update: (context, value, previous) => value,
          child: ProxyProvider<IStatusNetworkOnlyListBloc,
              INetworkOnlyListBloc<IStatus>>(
            update: (context, value, previous) => value,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.remote;

  @override
  Uri get remoteInstanceUriOrNull => instanceUri;
}
