import 'package:fedi/app/account/my/featured_hashtag/list/network_only/my_account_featured_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/list/network_only/my_account_featured_hashtag_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/my/featured_hashtag/list/page/my_account_featured_hashtag_list_page_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/list/page/my_account_featured_hashtag_list_page_bloc_proxy_provider.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/network_only/my_account_featured_hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/network_only/my_account_featured_hashtag_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagListPageBloc extends DisposableOwner
    implements IAccountFeaturedHashtagListPageBloc {
  final IPaginationSettingsBloc paginationSettingsBloc;

  final IUnifediApiMyAccountService unifediApiMyAccountService;

  AccountFeaturedHashtagListPageBloc({
    required this.paginationSettingsBloc,
    required this.unifediApiMyAccountService,
    required IConnectionService connectionService,
  }) {
    accountFeaturedHashtagListNetworkOnlyListBloc =
        AccountFeaturedHashtagListNetworkOnlyListBloc(
      unifediApiMyAccountService: unifediApiMyAccountService,
    );

    accountFeaturedHashtagListNetworkOnlyPaginationBloc =
        AccountFeaturedHashtagNetworkOnlyPaginationBloc(
      connectionService: connectionService,
      listBloc: accountFeaturedHashtagListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    hashtagPaginationListBloc = AccountFeaturedHashtagPaginationListBloc(
      paginationBloc: accountFeaturedHashtagListNetworkOnlyPaginationBloc,
    );

    accountFeaturedHashtagListNetworkOnlyListBloc.disposeWith(this);
    accountFeaturedHashtagListNetworkOnlyPaginationBloc.disposeWith(this);
    hashtagPaginationListBloc.disposeWith(this);

    // ignore: unawaited_futures
    hashtagPaginationListBloc.refreshWithoutController();
  }

  @override
  // ignore: avoid-late-keyword
  late IAccountFeaturedHashtagListNetworkOnlyListBloc
      accountFeaturedHashtagListNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountFeaturedHashtagNetworkOnlyPaginationBloc
      accountFeaturedHashtagListNetworkOnlyPaginationBloc;

  @override
  // ignore: avoid-late-keyword
  late IAccountFeaturedHashtagPaginationListBloc hashtagPaginationListBloc;

  static AccountFeaturedHashtagListPageBloc createFromContext(
    BuildContext context,
  ) {
    var unifediApiMyAccountService =
        Provider.of<IUnifediApiMyAccountService>(context, listen: false);

    return AccountFeaturedHashtagListPageBloc(
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
    return DisposableProvider<IAccountFeaturedHashtagListPageBloc>(
      create: (context) =>
          AccountFeaturedHashtagListPageBloc.createFromContext(context),
      child: AccountFeaturedBlocProxyProvider(child: child),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
