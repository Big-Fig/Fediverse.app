import 'package:fedi/app/account/my/featured_hashtag/list/my_account_featured_hashtag_list_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/list/network_only/my_account_featured_hashtag_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/list/page/my_account_featured_hashtag_list_page_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/network_only/my_account_featured_hashtag_network_only_pagination_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountFeaturedBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const AccountFeaturedBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IAccountFeaturedHashtagListPageBloc,
          IAccountFeaturedHashtagListNetworkOnlyListBloc>(
        update: (context, bloc, previous) =>
            bloc.accountFeaturedHashtagListNetworkOnlyListBloc,
        child: ProxyProvider<IAccountFeaturedHashtagListPageBloc,
            IAccountFeaturedHashtagListBloc>(
          update: (context, bloc, previous) =>
              bloc.accountFeaturedHashtagListNetworkOnlyListBloc,
          child: ProxyProvider<IAccountFeaturedHashtagListPageBloc,
              IAccountFeaturedHashtagNetworkOnlyPaginationBloc>(
            update: (context, bloc, previous) =>
                bloc.accountFeaturedHashtagListNetworkOnlyPaginationBloc,
            child: ProxyProvider<IAccountFeaturedHashtagListPageBloc,
                IAccountFeaturedHashtagPaginationListBloc>(
              update: (context, bloc, previous) =>
                  bloc.hashtagPaginationListBloc,
              child: ProxyProvider<
                  IAccountFeaturedHashtagListPageBloc,
                  IPaginationListBloc<PaginationPage<IMyAccountFeaturedHashtag>,
                      IMyAccountFeaturedHashtag>>(
                update: (context, bloc, previous) =>
                    bloc.hashtagPaginationListBloc,
                child: child,
              ),
            ),
          ),
        ),
      );
}
