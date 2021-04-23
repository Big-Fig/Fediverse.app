import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/statuses/favourites/network_only/account_statuses_favourites_network_only_list_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class LocalAccountStatusesFavouritesNetworkOnlyListBloc
    extends AccountStatusesFavouritesNetworkOnlyListBloc {
  LocalAccountStatusesFavouritesNetworkOnlyListBloc({
    required IAccount? account,
    required IPleromaAccountService pleromaAccountService,
  }) : super(
          account: account,
          pleromaAccountService: pleromaAccountService,
        );

  static LocalAccountStatusesFavouritesNetworkOnlyListBloc createFromContext(
    BuildContext context, {
    required IAccount? account,
  }) {
    return LocalAccountStatusesFavouritesNetworkOnlyListBloc(
      account: account,
      pleromaAccountService: IPleromaAccountService.of(context, listen: false),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required IAccount? account,
    required Widget child,
  }) {
    return DisposableProvider<IStatusNetworkOnlyListBloc>(
      create: (context) =>
          LocalAccountStatusesFavouritesNetworkOnlyListBloc.createFromContext(
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
