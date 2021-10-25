import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi_app/pagination/pagination_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AccountPaginationListBloc
    extends PaginationListBloc<PaginationPage<IAccount>, IAccount>
    implements IAccountPaginationListBloc {
  AccountPaginationListBloc({
    required IPaginationBloc<PaginationPage<IAccount>, IAccount> paginationBloc,
    bool loadFromCacheDuringInit = true,
  }) : super(
          paginationBloc: paginationBloc,
          loadFromCacheDuringInit: loadFromCacheDuringInit,
        );

  static AccountPaginationListBloc createFromContext(
    BuildContext context, {
    bool loadFromCacheDuringInit = true,
  }) =>
      AccountPaginationListBloc(
        paginationBloc:
            Provider.of<IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
          context,
          listen: false,
        ),
        loadFromCacheDuringInit: loadFromCacheDuringInit,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    bool loadFromCacheDuringInit = true,
  }) =>
      DisposableProvider<IAccountPaginationListBloc>(
        create: (context) => AccountPaginationListBloc.createFromContext(
          context,
          loadFromCacheDuringInit: loadFromCacheDuringInit,
        ),
        child: AccountPaginationListBlocProxyProvider(child: child),
      );
}
