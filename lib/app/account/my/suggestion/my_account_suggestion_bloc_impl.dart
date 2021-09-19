import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/my/suggestion/my_account_suggestion_bloc.dart';
import 'package:fedi/app/account/my/suggestion/my_account_suggestion_bloc_proxy_provider.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MyAccountSuggestionBloc extends DisposableOwner
    implements IMyAccountSuggestionBloc {
  final IPaginationSettingsBloc paginationSettingsBloc;

  final IUnifediApiMyAccountService unifediApiMyAccountService;
  MyAccountSuggestionBloc({
    required this.unifediApiMyAccountService,
    required this.paginationSettingsBloc,
    required IConnectionService connectionService,
  }) {
    myAccountSuggestionAccountListNetworkOnlyListBloc =
        MyAccountSuggestionAccountListNetworkOnlyListBloc(
      unifediApiMyAccountService: unifediApiMyAccountService,
      remoteInstanceUriOrNull: remoteInstanceUriOrNull,
      instanceLocation: instanceLocation,
    );

    myAccountSuggestionAccountListNetworkOnlyPaginationBloc =
        AccountNetworkOnlyPaginationBloc(
      connectionService: connectionService,
      listBloc: myAccountSuggestionAccountListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    accountPaginationListBloc = AccountPaginationListBloc(
      paginationBloc: myAccountSuggestionAccountListNetworkOnlyPaginationBloc,
    );

    myAccountSuggestionAccountListNetworkOnlyListBloc.disposeWith(this);
    myAccountSuggestionAccountListNetworkOnlyPaginationBloc.disposeWith(this);
    accountPaginationListBloc.disposeWith(this);

    // ignore: unawaited_futures
    accountPaginationListBloc.refreshWithoutController();
  }

  @override
  // ignore: avoid-late-keyword
  late IMyAccountSuggestionAccountListNetworkOnlyListBloc
      myAccountSuggestionAccountListNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountNetworkOnlyPaginationBloc
      myAccountSuggestionAccountListNetworkOnlyPaginationBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountPaginationListBloc accountPaginationListBloc;

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;

  static MyAccountSuggestionBloc createFromContext(BuildContext context) {
    var unifediApiMyAccountService =
        Provider.of<IUnifediApiMyAccountService>(context, listen: false);

    return MyAccountSuggestionBloc(
      connectionService: Provider.of<IConnectionService>(
        context,
        listen: false,
      ),
      unifediApiMyAccountService: unifediApiMyAccountService,
      paginationSettingsBloc: IPaginationSettingsBloc.of(
        context,
        listen: false,
      ),
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<IMyAccountSuggestionBloc>(
      create: (context) => MyAccountSuggestionBloc.createFromContext(context),
      child: MyAccountSuggestionBlocProxyProvider(child: child),
    );
  }
}
