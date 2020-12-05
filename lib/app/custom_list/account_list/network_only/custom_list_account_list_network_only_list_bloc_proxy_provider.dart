import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/app/custom_list/account_list/network_only/custom_list_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomListAccountListNetworkOnlyListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  CustomListAccountListNetworkOnlyListBlocProxyProvider({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<ICustomListAccountListNetworkOnlyListBloc,
        INetworkOnlyListBloc<IAccount>>(
      update: (context, value, previous) => value,
      child: AccountPaginationListBlocProxyProvider(
        child: child,
      ),
    );
  }
}
