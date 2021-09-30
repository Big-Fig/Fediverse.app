import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc.dart';
import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HashtagPaginationListBloc
    extends PaginationListBloc<PaginationPage<IHashtag>, IHashtag>
    implements IHashtagPaginationListBloc {
  HashtagPaginationListBloc({
    required IPaginationBloc<PaginationPage<IHashtag>, IHashtag> paginationBloc,
    bool loadFromCacheDuringInit = true,
  }) : super(
          paginationBloc: paginationBloc,
          loadFromCacheDuringInit: loadFromCacheDuringInit,
        );

  static HashtagPaginationListBloc createFromContext(
    BuildContext context, {
    bool loadFromCacheDuringInit = true,
  }) {
    return HashtagPaginationListBloc(
      paginationBloc:
          Provider.of<IPaginationBloc<PaginationPage<IHashtag>, IHashtag>>(
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
    return DisposableProvider<IHashtagPaginationListBloc>(
      create: (context) => HashtagPaginationListBloc.createFromContext(
        context,
        loadFromCacheDuringInit: loadFromCacheDuringInit,
      ),
      child: HashtagPaginationListBlocProxyProvider(child: child),
    );
  }
}
