import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc.dart';
import 'package:fedi_app/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagPaginationListBloc extends PaginationListBloc<
        PaginationPage<IMyAccountFeaturedHashtag>, IMyAccountFeaturedHashtag>
    implements IAccountFeaturedHashtagPaginationListBloc {
  AccountFeaturedHashtagPaginationListBloc({
    required IPaginationBloc<PaginationPage<IMyAccountFeaturedHashtag>,
            IMyAccountFeaturedHashtag>
        paginationBloc,
    bool loadFromCacheDuringInit = true,
  }) : super(
          paginationBloc: paginationBloc,
          loadFromCacheDuringInit: loadFromCacheDuringInit,
        );

  static AccountFeaturedHashtagPaginationListBloc createFromContext(
    BuildContext context, {
    bool loadFromCacheDuringInit = true,
  }) =>
      AccountFeaturedHashtagPaginationListBloc(
        paginationBloc: Provider.of<
            IPaginationBloc<PaginationPage<IMyAccountFeaturedHashtag>,
                IMyAccountFeaturedHashtag>>(
          context,
          listen: false,
        ),
        loadFromCacheDuringInit: loadFromCacheDuringInit,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    bool loadFromCacheDuringInit = true,
  }) =>
      DisposableProvider<IAccountFeaturedHashtagPaginationListBloc>(
        create: (context) =>
            AccountFeaturedHashtagPaginationListBloc.createFromContext(
          context,
          loadFromCacheDuringInit: loadFromCacheDuringInit,
        ),
        child:
            AccountFeaturedHashtagPaginationListBlocProxyProvider(child: child),
      );
}
