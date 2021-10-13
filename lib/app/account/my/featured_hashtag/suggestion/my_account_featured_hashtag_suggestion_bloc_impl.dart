import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/featured_hashtag/suggestion/hashtag_list/network_only/my_account_featured_hashtag_suggestion_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/suggestion/hashtag_list/network_only/my_account_featured_hashtag_suggestion_hashtag_list_network_only_list_bloc_impl.dart';
import 'package:fedi/app/account/my/featured_hashtag/suggestion/my_account_featured_hashtag_suggestion_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/suggestion/my_account_featured_hashtag_suggestion_bloc_proxy_provider.dart';
import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc_impl.dart';
import 'package:fedi/app/hashtag/pagination/network_only/hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/app/hashtag/pagination/network_only/hashtag_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MyAccountFeaturedHashtagSuggestionBloc extends DisposableOwner
    implements IMyAccountFeaturedHashtagSuggestionBloc {
  final IPaginationSettingsBloc paginationSettingsBloc;

  final IUnifediApiMyAccountService unifediApiMyAccountService;

  MyAccountFeaturedHashtagSuggestionBloc({
    required this.paginationSettingsBloc,
    required this.unifediApiMyAccountService,
    required IConnectionService connectionService,
  }) {
    myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc =
        MyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc(
      unifediApiMyAccountService: unifediApiMyAccountService,
    );

    myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyPaginationBloc =
        HashtagNetworkOnlyPaginationBloc(
      connectionService: connectionService,
      listBloc:
          myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    hashtagPaginationListBloc = HashtagPaginationListBloc(
      paginationBloc:
          myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyPaginationBloc,
    );

    myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc
        .disposeWith(this);
    myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyPaginationBloc
        .disposeWith(this);
    hashtagPaginationListBloc.disposeWith(this);

    // ignore: unawaited_futures, cascade_invocations
    hashtagPaginationListBloc.refreshWithoutController();
  }

  @override
  // ignore: avoid-late-keyword
  late IMyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc
      myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc;

  @override
  // ignore: avoid-late-keyword
  late IHashtagNetworkOnlyPaginationBloc
      myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyPaginationBloc;

  @override
  // ignore: avoid-late-keyword
  late IHashtagPaginationListBloc hashtagPaginationListBloc;

  static MyAccountFeaturedHashtagSuggestionBloc createFromContext(
    BuildContext context,
  ) {
    var unifediApiMyAccountService =
        Provider.of<IUnifediApiMyAccountService>(context, listen: false);

    return MyAccountFeaturedHashtagSuggestionBloc(
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
  }) =>
      DisposableProvider<IMyAccountFeaturedHashtagSuggestionBloc>(
        create: (context) =>
            MyAccountFeaturedHashtagSuggestionBloc.createFromContext(context),
        child:
            MyAccountFeaturedHashtagSuggestionBlocProxyProvider(child: child),
      );

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
