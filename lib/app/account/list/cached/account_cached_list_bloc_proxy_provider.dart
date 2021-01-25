import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/list/account_list_bloc.dart';
import 'package:fedi/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  AccountCachedListBlocProxyProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IAccountCachedListBloc,
        IPleromaCachedListBloc<IAccount>>(
      update: (context, value, previous) => value,
      child: ProxyProvider<IAccountCachedListBloc, IAccountListBloc>(
        update: (context, value, previous) => value,
        child: child,
      ),
    );
  }
}
