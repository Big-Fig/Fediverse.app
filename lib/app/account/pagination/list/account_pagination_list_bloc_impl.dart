import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AccountPaginationListBloc
    extends PaginationListBloc<PaginationPage<IAccount>, IAccount>
    implements IAccountPaginationListBloc {
  AccountPaginationListBloc({
    @required
        IPaginationBloc<PaginationPage<IAccount>, IAccount> paginationBloc,
  }) : super(paginationBloc: paginationBloc);

  static AccountPaginationListBloc createFromContext(BuildContext context) {
    return AccountPaginationListBloc(
        paginationBloc:
            Provider.of<IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
                context,
                listen: false));
  }

  static Widget provideToContext(BuildContext context,
      {@required Widget child}) {
    return DisposableProvider<IAccountPaginationListBloc>(
      create: (context) => AccountPaginationListBloc.createFromContext(
        context,
      ),
      child: AccountPaginationListBlocProxyProvider(child: child),
    );
  }
}
