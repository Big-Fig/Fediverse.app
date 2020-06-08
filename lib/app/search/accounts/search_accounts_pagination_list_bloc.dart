import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("search_accounts_pagination_list_bloc.dart");

class SearchAccountsPaginationListBloc extends AccountPaginationListBloc {
  final ISearchInputBloc searchInputBloc;
  SearchAccountsPaginationListBloc({
    @required this.searchInputBloc,
    @required
        IPaginationBloc<PaginationPage<IAccount>, IAccount> paginationBloc,
  }) : super(paginationBloc: paginationBloc) {
    addDisposable(
        streamSubscription:
            searchInputBloc.searchTextStream.distinct().listen((newText) {
      // refresh controller if it attached
      if (refreshController.position != null) {
        try {
          refreshController.requestRefresh(needMove:false);
        } on Exception catch (e, stackTrace) {
          // ignore error, because it is related to refresh controller
          // internal wrong logic
          _logger.warning(
              () => "error during refreshController.requestRefresh(needMove:false);",
              e,
              stackTrace);
        }
      } else {
        //otherwise refresh only bloc
        paginationBloc.refresh();
      }
    }));
  }

  static SearchAccountsPaginationListBloc createFromContext(
          BuildContext context) =>
      SearchAccountsPaginationListBloc(
          paginationBloc:
              Provider.of<IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
                  context,
                  listen: false),
          searchInputBloc: ISearchInputBloc.of(context, listen: false));
}
