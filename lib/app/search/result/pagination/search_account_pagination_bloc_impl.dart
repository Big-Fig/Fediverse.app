import 'package:collection/collection.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/search/result/pagination/search_adapter_pagination_bloc_impl.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchAccountPaginationBloc
    extends SearchAdapterPaginationBloc<IAccount> {
  SearchAccountPaginationBloc({
    required IPaginationBloc<PaginationPage<ISearchResultItem>,
            ISearchResultItem>
        searchResultItemPaginationBloc,
  }) : super(searchResultItemPaginationBloc: searchResultItemPaginationBloc);

  @override
  PaginationPage<IAccount> mapPage(PaginationPage<ISearchResultItem> page) {
    // IterableExtension
    var items = page.items
        .where((searchResultItem) =>
            searchResultItem.type == SearchResultItemType.account)
        .map((searchResultItem) => searchResultItem.account)
        .whereNotNull()
        .toList();

    return PaginationPage(
      requestedLimitPerPage: page.requestedLimitPerPage,
      items: items,
      pageIndex: page.pageIndex,
    );
  }

  static SearchAccountPaginationBloc createFromContext(BuildContext context) =>
      SearchAccountPaginationBloc(
        searchResultItemPaginationBloc: Provider.of<
            IPaginationBloc<PaginationPage<ISearchResultItem>,
                ISearchResultItem>>(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) {
    return DisposableProvider<
        IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
      create: (context) =>
          SearchAccountPaginationBloc.createFromContext(context),
      child: child,
    );
  }
}
