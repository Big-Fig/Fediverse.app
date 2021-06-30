import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/pinned_only/network_only/account_statuses_pinned_only_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc
    extends AccountStatusesPinnedOnlyNetworkOnlyListBloc {
  LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc({
    required IAccount? account,
    required IPleromaApiAccountService pleromaAccountService,
  }) : super(
          account: account,
          pleromaAccountService: pleromaAccountService,
        );

  static LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required IAccount? account,
  }) {
    return LocalAccountStatusesPinnedOnlyNetworkOnlyListBloc(
      account: account,
      pleromaAccountService: IPleromaApiAccountService.of(context, listen: false),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required IAccount? account,
    required Widget child,
  }) {
    return DisposableProvider<IStatusNetworkOnlyListBloc>(
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
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
