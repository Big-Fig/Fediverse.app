import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountBlocProxyProvider extends StatelessWidget {
  final Widget child;

  MyAccountBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IMyAccountBloc, IAccountBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
