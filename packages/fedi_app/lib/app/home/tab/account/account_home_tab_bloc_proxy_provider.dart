import 'package:fedi_app/app/home/tab/account/account_home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/home_tab_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountHomeTabBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const AccountHomeTabBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IAccountHomeTabBloc, IHomeTabBloc>(
        update: (context, value, previous) => value,
        child: HomeTabBlocProxyProvider(child: child),
      );
}
