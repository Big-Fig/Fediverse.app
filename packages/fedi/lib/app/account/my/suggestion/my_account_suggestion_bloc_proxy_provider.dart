import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/account/my/suggestion/account_list/network_only/my_account_suggestion_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/suggestion/my_account_suggestion_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountSuggestionBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const MyAccountSuggestionBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<IMyAccountSuggestionBloc,
          IMyAccountSuggestionAccountListNetworkOnlyListBloc>(
        update: (context, bloc, previous) =>
            bloc.myAccountSuggestionAccountListNetworkOnlyListBloc,
        child: ProxyProvider<IMyAccountSuggestionBloc, IAccountListBloc>(
          update: (context, bloc, previous) =>
              bloc.myAccountSuggestionAccountListNetworkOnlyListBloc,
          child: ProxyProvider<IMyAccountSuggestionBloc,
              IAccountNetworkOnlyPaginationBloc>(
            update: (context, bloc, previous) =>
                bloc.myAccountSuggestionAccountListNetworkOnlyPaginationBloc,
            child: ProxyProvider<IMyAccountSuggestionBloc,
                IAccountPaginationListBloc>(
              update: (context, bloc, previous) =>
                  bloc.accountPaginationListBloc,
              child: child,
            ),
          ),
        ),
      );
}
