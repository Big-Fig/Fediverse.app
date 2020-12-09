import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/custom_list/edit/account_list/edit_custom_list_account_list_pagination_list_bloc.dart';
import 'package:fedi/pagination/list/edit/edit_pagination_list_bloc.dart';
import 'package:fedi/pagination/list/edit/edit_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditCustomListAccountListPaginationListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  EditCustomListAccountListPaginationListBlocProxyProvider(
      {@required this.child});

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditCustomListAccountListPaginationListBloc,
          IEditPaginationListBloc<PaginationPage<IAccount>, IAccount>>(
        update: (context, value, _) => value,
        child: ProxyProvider<IEditCustomListAccountListPaginationListBloc,
            IAccountPaginationListBloc>(
          update: (context, value, _) => value,
          child: EditPaginationListBlocProxyProvider<PaginationPage<IAccount>,
              IAccount>(
            child: child,
          ),
        ),
      );
}
