import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/result/search_result_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchResultItemPaginationListBloc extends PaginationListBloc<
    PaginationPage<ISearchResultItem>, ISearchResultItem> {
  final ISearchInputBloc searchInputBloc;

  SearchResultItemPaginationListBloc({
    required this.searchInputBloc,
    required IPaginationBloc<PaginationPage<ISearchResultItem>,
            ISearchResultItem>
        paginationBloc,
  }) : super(paginationBloc: paginationBloc) {
    addDisposable(streamSubscription:
        searchInputBloc.confirmedSearchTermStream.listen((newText) {
      refreshWithController();
    }));
  }

  static SearchResultItemPaginationListBloc createFromContext(
    BuildContext context,
  ) =>
      SearchResultItemPaginationListBloc(
        paginationBloc: Provider.of<
            IPaginationBloc<PaginationPage<ISearchResultItem>,
                ISearchResultItem>>(context, listen: false),
        searchInputBloc: ISearchInputBloc.of(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<
          IPaginationListBloc<PaginationPage<ISearchResultItem>,
              ISearchResultItem>>(
        create: (context) =>
            SearchResultItemPaginationListBloc.createFromContext(context),
        child: child,
      );
}
