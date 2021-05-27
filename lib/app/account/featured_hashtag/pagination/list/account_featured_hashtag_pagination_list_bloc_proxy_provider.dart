import 'package:fedi/app/account/featured_hashtag/account_featured_hashtag_model.dart';
import 'package:fedi/app/account/featured_hashtag/pagination/list/account_featured_hashtag_pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagPaginationListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  AccountFeaturedHashtagPaginationListBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<
        IAccountFeaturedHashtagPaginationListBloc,
        IPaginationListBloc<PaginationPage<IAccountFeaturedHashtag>,
            IAccountFeaturedHashtag>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IAccountFeaturedHashtagPaginationListBloc,
          IPaginationListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
