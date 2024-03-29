import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/custom_list/account_list/network_only/custom_list_account_list_network_only_list_bloc.dart';
import 'package:fedi_app/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CustomListAccountListNetworkOnlyListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const CustomListAccountListNetworkOnlyListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ICustomListAccountListNetworkOnlyListBloc,
          INetworkOnlyListBloc<IAccount>>(
        update: (context, value, previous) => value,
        child: AccountPaginationListBlocProxyProvider(
          child: child,
        ),
      );
}
