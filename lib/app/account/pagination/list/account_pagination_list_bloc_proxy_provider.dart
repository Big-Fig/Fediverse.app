import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountPaginationListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  AccountPaginationListBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IAccountPaginationListBloc,
        IPaginationListBloc<PaginationPage<IAccount>, IAccount>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IAccountPaginationListBloc, IPaginationListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
