import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SelectAccountPaginationListBloc extends AccountPaginationListBloc {
  final ISearchInputBloc searchInputBloc;

  SelectAccountPaginationListBloc({
    required this.searchInputBloc,
    required IPaginationBloc<PaginationPage<IAccount>, IAccount> paginationBloc,
  }) : super(paginationBloc: paginationBloc) {
    searchInputBloc.confirmedSearchTermStream.listen(
      (newText) {
        // refresh controller if it attached
        refreshWithController();
      },
    ).disposeWith(this);
  }

  static SelectAccountPaginationListBloc createFromContext(
    BuildContext context,
  ) =>
      SelectAccountPaginationListBloc(
        paginationBloc:
            Provider.of<IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
          context,
          listen: false,
        ),
        searchInputBloc: ISearchInputBloc.of(context, listen: false),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IAccountPaginationListBloc>(
        create: (context) =>
            SelectAccountPaginationListBloc.createFromContext(context),
        child: AccountPaginationListBlocProxyProvider(child: child),
      );
}
