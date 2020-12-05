import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/pagination/list/edit/edit_pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditCustomListAccountListPaginationListBloc
    implements
        IEditPaginationListBloc<PaginationPage<IAccount>, IAccount>,
        IAccountPaginationListBloc {
  static IEditCustomListAccountListPaginationListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IEditCustomListAccountListPaginationListBloc>(context,
          listen: listen);
}
