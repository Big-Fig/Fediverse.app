import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchStatusesPaginationListBloc extends StatusPaginationListBloc {
  final ISearchInputBloc searchInputBloc;
  SearchStatusesPaginationListBloc({
    @required this.searchInputBloc,
    @required IPaginationBloc<PaginationPage<IStatus>, IStatus> paginationBloc,
  }) : super(paginationBloc: paginationBloc) {
    addDisposable(
        streamSubscription:
            searchInputBloc.searchTextStream.distinct().listen((newText) {
      // refresh controller if it attached
      if (refreshController.position != null) {
        refreshController.requestRefresh();
      } else {
        //otherwise refresh only bloc
        paginationBloc.refresh();
      }
    }));
  }

  static SearchStatusesPaginationListBloc createFromContext(
      BuildContext context) =>
      SearchStatusesPaginationListBloc(
          paginationBloc:
          Provider.of<IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
              context),
          searchInputBloc: ISearchInputBloc.of(context, listen: false)
      );
}
