import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_impl.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/custom_list/accounts/custom_list_account_network_only_list_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomListAccountListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  CustomListAccountListBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<ICustomListAccountNetworkOnlyListBloc,
        INetworkOnlyListBloc<IAccount>>(
      update: (context, value, previous) => value,
      child: DisposableProvider<
          IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
        create: (context) {
          return AccountNetworkOnlyPaginationBloc(
            itemsCountPerPage: 20,
            maximumCachedPagesCount: null,
            listService: ICustomListAccountNetworkOnlyListBloc.of(context,
                listen: false),
          );
        },
        child: DisposableProvider<IAccountPaginationListBloc>(
          create: (context) {
            return AccountPaginationListBloc(
              paginationBloc: Provider.of<
                      IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
                  context,
                  listen: false),
            );
          },
          child: AccountPaginationListBlocProxyProvider(
            child: child,
          ),
        ),
      ),
    );
  }
}
