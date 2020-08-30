import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/search/result/pagination/search_adapter_pagination_bloc_impl.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchHashtagPaginationBloc
    extends SearchAdapterPaginationBloc<IHashtag> {
  SearchHashtagPaginationBloc(
      {@required
          IPaginationBloc<PaginationPage<ISearchResultItem>, ISearchResultItem>
              searchResultItemPaginationBloc})
      : super(searchResultItemPaginationBloc: searchResultItemPaginationBloc);

  @override
  PaginationPage<IHashtag> mapPage(PaginationPage<ISearchResultItem> page) {
    List<IHashtag> items = page.items
        .where((searchResultItem) => searchResultItem.type ==
        SearchResultItemType.hashtag)
        .map((searchResultItem) => searchResultItem.hashtag)
        .toList();
    return PaginationPage(
      requestedLimitPerPage: page.requestedLimitPerPage,
      items: items,
      pageIndex: page.pageIndex,
    );
  }

  static SearchHashtagPaginationBloc createFromContext(BuildContext context) =>
      SearchHashtagPaginationBloc(
        searchResultItemPaginationBloc: Provider.of<
            IPaginationBloc<PaginationPage<ISearchResultItem>,
                ISearchResultItem>>(context, listen: false),
      );

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<
        IPaginationBloc<PaginationPage<IHashtag>, IHashtag>>(
      create: (context) =>
          SearchHashtagPaginationBloc.createFromContext(context),
      child: child,
    );
  }
}
