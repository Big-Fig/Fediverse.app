import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagPaginationListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const AccountFeaturedHashtagPaginationListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IAccountFeaturedHashtagPaginationListBloc,
          IPaginationListBloc<PaginationPage<IMyAccountFeaturedHashtag>,
              IMyAccountFeaturedHashtag>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IAccountFeaturedHashtagPaginationListBloc,
            IPaginationListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
