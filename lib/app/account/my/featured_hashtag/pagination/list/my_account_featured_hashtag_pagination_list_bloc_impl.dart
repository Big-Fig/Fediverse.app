import 'package:fedi/app/account/my/featured_hashtag/my_account_featured_hashtag_model.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/account/my/featured_hashtag/pagination/list/my_account_featured_hashtag_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AccountFeaturedHashtagPaginationListBloc extends PaginationListBloc<
        PaginationPage<IAccountFeaturedHashtag>, IAccountFeaturedHashtag>
    implements IAccountFeaturedHashtagPaginationListBloc {
  AccountFeaturedHashtagPaginationListBloc({
    required IPaginationBloc<PaginationPage<IAccountFeaturedHashtag>,
            IAccountFeaturedHashtag>
        paginationBloc,
    bool loadFromCacheDuringInit = true,
  }) : super(
          paginationBloc: paginationBloc,
          loadFromCacheDuringInit: loadFromCacheDuringInit,
        );

  static AccountFeaturedHashtagPaginationListBloc createFromContext(
    BuildContext context, {
    bool loadFromCacheDuringInit = true,
  }) {
    return AccountFeaturedHashtagPaginationListBloc(
      paginationBloc: Provider.of<
          IPaginationBloc<PaginationPage<IAccountFeaturedHashtag>,
              IAccountFeaturedHashtag>>(
        context,
        listen: false,
      ),
      loadFromCacheDuringInit: loadFromCacheDuringInit,
    );
  }

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    bool loadFromCacheDuringInit = true,
  }) {
    return DisposableProvider<IAccountFeaturedHashtagPaginationListBloc>(
      create: (context) =>
          AccountFeaturedHashtagPaginationListBloc.createFromContext(
        context,
        loadFromCacheDuringInit: loadFromCacheDuringInit,
      ),
      child:
          AccountFeaturedHashtagPaginationListBlocProxyProvider(child: child),
    );
  }
}
