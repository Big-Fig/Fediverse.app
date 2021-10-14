import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/account/my/endorsement/account_list/network_only/my_account_endorsement_account_list_network_only_list_bloc.dart';
import 'package:fedi/app/account/my/endorsement/my_account_endorsement_bloc.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountEndorsementBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const MyAccountEndorsementBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<IMyAccountEndorsementBloc,
          IMyAccountEndorsementAccountListNetworkOnlyListBloc>(
        update: (context, bloc, previous) =>
            bloc.myAccountEndorsementAccountListNetworkOnlyListBloc,
        child: ProxyProvider<IMyAccountEndorsementBloc, IAccountListBloc>(
          update: (context, bloc, previous) =>
              bloc.myAccountEndorsementAccountListNetworkOnlyListBloc,
          child: ProxyProvider<IMyAccountEndorsementBloc,
              IAccountNetworkOnlyPaginationBloc>(
            update: (context, bloc, previous) =>
                bloc.myAccountEndorsementAccountListNetworkOnlyPaginationBloc,
            child: ProxyProvider<IMyAccountEndorsementBloc,
                IAccountPaginationListBloc>(
              update: (context, bloc, previous) =>
                  bloc.accountPaginationListBloc,
              child: child,
            ),
          ),
        ),
      );
}
