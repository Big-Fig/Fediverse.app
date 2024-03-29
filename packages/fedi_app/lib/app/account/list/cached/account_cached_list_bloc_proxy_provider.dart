import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/list/account_list_bloc.dart';
import 'package:fedi_app/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const AccountCachedListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IAccountCachedListBloc, ICachedListBloc<IAccount>>(
        update: (context, value, previous) => value,
        child: ProxyProvider<IAccountCachedListBloc, IAccountListBloc>(
          update: (context, value, previous) => value,
          child: child,
        ),
      );
}
