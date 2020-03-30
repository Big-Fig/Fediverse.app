import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAccountPaginationListBloc
    implements
        IPaginationListBloc<CachedNetworkPaginationPage<IAccount>, IAccount> {
  static IAccountPaginationListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IAccountPaginationListBloc>(context, listen: listen);
}
