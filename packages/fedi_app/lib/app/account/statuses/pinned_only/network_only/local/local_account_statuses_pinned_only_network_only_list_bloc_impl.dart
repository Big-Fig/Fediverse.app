import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/statuses/pinned_only/network_only/account_statuses_pinned_only_network_only_list_bloc_impl.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi_app/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc
    extends AccountStatusesPinnedOnlyNetworkOnlyListBloc {
  LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc({
    required IAccount? account,
    required IUnifediApiAccountService unifediApiAccountService,
  }) : super(
          account: account,
          unifediApiAccountService: unifediApiAccountService,
        );

  static LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required IAccount? account,
  }) =>
      LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc(
        account: account,
        unifediApiAccountService:
            Provider.of<IUnifediApiAccountService>(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required IAccount? account,
    required Widget child,
  }) =>
      DisposableProvider<IStatusNetworkOnlyListBloc>(
        create: (context) =>
            LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc.createFromContext(
          context,
          account: account,
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
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
