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
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_service.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

class AccountFeaturedHashtagListPageBloc extends DisposableOwner
    implements IAccountFeaturedHashtagListPageBloc {
  final IPaginationSettingsBloc paginationSettingsBloc;

  final IPleromaApiFeaturedTagsService pleromaApiFeaturedTagsService;

  AccountFeaturedHashtagListPageBloc({
    required this.paginationSettingsBloc,
    required this.pleromaApiFeaturedTagsService,
  }) {
    accountFeaturedHashtagListNetworkOnlyListBloc =
        AccountFeaturedHashtagListNetworkOnlyListBloc(
      pleromaApiFeaturedTagsService: pleromaApiFeaturedTagsService,
    );

    accountFeaturedHashtagListNetworkOnlyPaginationBloc =
        AccountFeaturedHashtagNetworkOnlyPaginationBloc(
      listBloc: accountFeaturedHashtagListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    hashtagPaginationListBloc = AccountFeaturedHashtagPaginationListBloc(
      paginationBloc: accountFeaturedHashtagListNetworkOnlyPaginationBloc,
    );

    addDisposable(disposable: accountFeaturedHashtagListNetworkOnlyListBloc);
    addDisposable(
      disposable: accountFeaturedHashtagListNetworkOnlyPaginationBloc,
    );
    addDisposable(disposable: hashtagPaginationListBloc);

    unawaited(hashtagPaginationListBloc.refreshWithoutController());
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
      BuildContext context) {
    var pleromaApiFeaturedTagsService =
        IPleromaApiFeaturedTagsService.of(context, listen: false);

    return AccountFeaturedHashtagListPageBloc(
      pleromaApiFeaturedTagsService: pleromaApiFeaturedTagsService,
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
