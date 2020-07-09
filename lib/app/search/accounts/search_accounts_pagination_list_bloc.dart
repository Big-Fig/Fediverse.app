import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchAccountsPaginationListBloc extends AccountPaginationListBloc {
  final ISearchInputBloc searchInputBloc;
  SearchAccountsPaginationListBloc({
    @required this.searchInputBloc,
    @required
        IPaginationBloc<PaginationPage<IAccount>, IAccount> paginationBloc,
  }) : super(paginationBloc: paginationBloc) {
    addDisposable(streamSubscription:
    searchInputBloc.confirmedSearchTermStream.listen((newText) {
      refreshWithController();
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
