import 'package:fedi/app/account/featured_hashtag/account_featured_hashtag_model.dart';
import 'package:fedi/app/account/featured_hashtag/list/network_only/account_featured_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/featured_hashtag/pagination/list/account_featured_hashtag_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagListNetworkOnlyListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  AccountFeaturedHashtagListNetworkOnlyListBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IAccountFeaturedHashtagListNetworkOnlyListBloc,
        INetworkOnlyListBloc<IAccountFeaturedHashtag>>(
      update: (context, value, previous) => value,
      child: AccountFeaturedHashtagPaginationListBlocProxyProvider(
        child: child,
      ),
    );
  }
}
