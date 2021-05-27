import 'package:fedi/app/account/my/featured_hashtag/suggestion/hashtag_list/network_only/my_account_featured_hashtag_suggestion_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  MyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<
        IMyAccountFeaturedHashtagSuggestionHashtagListNetworkOnlyListBloc,
        INetworkOnlyListBloc<IHashtag>>(
      update: (context, value, previous) => value,
      child: HashtagPaginationListBlocProxyProvider(
        child: child,
      ),
    );
  }
}
