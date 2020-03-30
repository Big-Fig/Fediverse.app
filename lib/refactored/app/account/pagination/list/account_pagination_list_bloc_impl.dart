
import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/pagination/account_pagination_bloc.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/widgets.dart';

class AccountPaginationListBloc
    extends PaginationListBloc<CachedNetworkPaginationPage<IAccount>, IAccount>
    implements IAccountPaginationListBloc {
  AccountPaginationListBloc(
      {@required IAccountPaginationBloc paginationBloc})
      : super(paginationBloc: paginationBloc);
}
