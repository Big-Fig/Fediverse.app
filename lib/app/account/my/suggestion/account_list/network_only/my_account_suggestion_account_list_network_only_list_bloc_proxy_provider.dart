import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc_proxy_provider.dart';
import 'package:fedi/app/list/network_only/network_only_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountSuggestionAccountListNetworkOnlyListBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const MyAccountSuggestionAccountListNetworkOnlyListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IMyAccountSuggestionAccountListNetworkOnlyListBloc,
          INetworkOnlyListBloc<IAccount>>(
        update: (context, value, previous) => value,
        child: AccountPaginationListBlocProxyProvider(
          child: child,
        ),
      );
}
