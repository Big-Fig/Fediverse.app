import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountPaginationListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const AccountPaginationListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IAccountPaginationListBloc,
          IPaginationListBloc<PaginationPage<IAccount>, IAccount>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IAccountPaginationListBloc, IPaginationListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
