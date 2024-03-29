import 'package:fedi_app/app/account/my/featured_hashtag/list/network_only/my_account_featured_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagListNetworkOnlyListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const AccountFeaturedHashtagListNetworkOnlyListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IAccountFeaturedHashtagListNetworkOnlyListBloc,
          INetworkOnlyListBloc<IMyAccountFeaturedHashtag>>(
        update: (context, value, previous) => value,
        child: AccountFeaturedHashtagPaginationListBlocProxyProvider(
          child: child,
        ),
      );
}
