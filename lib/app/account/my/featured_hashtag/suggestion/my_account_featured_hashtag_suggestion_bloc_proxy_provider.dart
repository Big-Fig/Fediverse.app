import 'package:fedi/app/account/my/featured_hashtag/suggestion/hashtag_list/network_only/my_account_featured_hashtag_suggestion_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/suggestion/my_account_featured_hashtag_suggestion_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/list/hashtag_list_bloc.dart';
import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/hashtag/pagination/network_only/hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountFeaturedHashtagSuggestionBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const MyAccountFeaturedHashtagSuggestionBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IMyAccountFeaturedHashtagSuggestionBloc,
          IMyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc>(
        update: (context, bloc, previous) => bloc
            .myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc,
        child: ProxyProvider<IMyAccountFeaturedHashtagSuggestionBloc,
            IHashtagListBloc>(
          update: (context, bloc, previous) => bloc
              .myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc,
          child: ProxyProvider<IMyAccountFeaturedHashtagSuggestionBloc,
              IHashtagNetworkOnlyPaginationBloc>(
            update: (context, bloc, previous) => bloc
                .myAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyPaginationBloc,
            child: ProxyProvider<IMyAccountFeaturedHashtagSuggestionBloc,
                IHashtagPaginationListBloc>(
              update: (context, bloc, previous) =>
                  bloc.hashtagPaginationListBloc,
              child: ProxyProvider<IMyAccountFeaturedHashtagSuggestionBloc,
                  IPaginationListBloc<PaginationPage<IHashtag>, IHashtag>>(
                update: (context, bloc, previous) =>
                    bloc.hashtagPaginationListBloc,
                child: child,
              ),
            ),
          ),
        ),
      );
}
