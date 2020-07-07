import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SelectAccountPaginationListBloc extends AccountPaginationListBloc {
  final ISearchInputBloc searchInputBloc;
  SelectAccountPaginationListBloc({
    @required this.searchInputBloc,
    @required
        IPaginationBloc<PaginationPage<IAccount>, IAccount> paginationBloc,
  }) : super(paginationBloc: paginationBloc) {
    addDisposable(streamSubscription:
        searchInputBloc.confirmedSearchTermStream.listen((newText) {
      // refresh controller if it attached
      refreshWithController();
    }));
  }

  static SelectAccountPaginationListBloc createFromContext(
          BuildContext context) =>
      SelectAccountPaginationListBloc(
          paginationBloc:
              Provider.of<IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
                  context,
                  listen: false),
          searchInputBloc: ISearchInputBloc.of(context, listen: false));
}
