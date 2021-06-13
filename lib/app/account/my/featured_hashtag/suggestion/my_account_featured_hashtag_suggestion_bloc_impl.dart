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
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_service.dart';
import 'package:flutter/widgets.dart';
import 'package:pedantic/pedantic.dart';

class MyAccountFeaturedHashtagSuggestionBloc extends DisposableOwner
    implements IMyAccountFeaturedHashtagSuggestionBloc {
  final IPaginationSettingsBloc paginationSettingsBloc;

  final IPleromaApiFeaturedTagsService pleromaApiFeaturedTagsService;

  MyAccountFeaturedHashtagSuggestionBloc({
    required this.paginationSettingsBloc,
    required this.pleromaApiFeaturedTagsService,
  }) {
    myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc =
        MyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc(
      pleromaApiFeaturedTagsService: pleromaApiFeaturedTagsService,
    );

    myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyPaginationBloc =
        HashtagNetworkOnlyPaginationBloc(
      listBloc:
          myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc,
      maximumCachedPagesCount: null,
      paginationSettingsBloc: paginationSettingsBloc,
    );
    hashtagPaginationListBloc = HashtagPaginationListBloc(
      paginationBloc:
          myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyPaginationBloc,
    );

    addDisposable(
      disposable:
          myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc,
    );
    addDisposable(
      disposable:
          myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyPaginationBloc,
    );
    addDisposable(disposable: hashtagPaginationListBloc);

    unawaited(hashtagPaginationListBloc.refreshWithoutController());
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
    var pleromaApiFeaturedTagsService =
        IPleromaApiFeaturedTagsService.of(context, listen: false);

    return MyAccountFeaturedHashtagSuggestionBloc(
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
    return DisposableProvider<IMyAccountFeaturedHashtagSuggestionBloc>(
      create: (context) =>
          MyAccountFeaturedHashtagSuggestionBloc.createFromContext(context),
      child: MyAccountFeaturedHashtagSuggestionBlocProxyProvider(child: child),
    );
  }

  @override
  InstanceLocation get instanceLocation => InstanceLocation.local;

  @override
  Uri? get remoteInstanceUriOrNull => null;
}
