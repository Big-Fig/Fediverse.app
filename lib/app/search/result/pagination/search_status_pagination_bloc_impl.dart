import 'package:fedi/app/search/result/pagination/search_adapter_pagination_bloc_impl.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchStatusPaginationBloc extends SearchAdapterPaginationBloc<IStatus> {
  SearchStatusPaginationBloc(
      {@required
          IPaginationBloc<PaginationPage<ISearchResultItem>, ISearchResultItem>
              searchResultItemPaginationBloc})
      : super(searchResultItemPaginationBloc: searchResultItemPaginationBloc);

  @override
  PaginationPage<IStatus> mapPage(PaginationPage<ISearchResultItem> page) {
    List<IStatus> items = page.items
        .where((searchResultItem) => searchResultItem.type ==
        SearchResultItemType.status)
        .map((searchResultItem) => searchResultItem.status)
        .toList();
    return PaginationPage(
      requestedLimitPerPage: page.requestedLimitPerPage,
      items: items,
      pageIndex: page.pageIndex,
    );
  }

  static SearchStatusPaginationBloc createFromContext(BuildContext context) =>
      SearchStatusPaginationBloc(
        searchResultItemPaginationBloc: Provider.of<
            IPaginationBloc<PaginationPage<ISearchResultItem>,
                ISearchResultItem>>(context, listen: false),
      );

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<
        IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
      create: (context) =>
          SearchStatusPaginationBloc.createFromContext(context),
      child: child,
    );
  }
}
