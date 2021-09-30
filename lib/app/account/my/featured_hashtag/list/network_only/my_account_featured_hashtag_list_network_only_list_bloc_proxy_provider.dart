import 'package:fedi/app/account/my/featured_hashtag/list/network_only/my_account_featured_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc_proxy_provider.dart';
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
        INetworkOnlyListBloc<IMyAccountFeaturedHashtag>>(
      update: (context, value, previous) => value,
      child: AccountFeaturedHashtagPaginationListBlocProxyProvider(
        child: child,
      ),
    );
  }
}
