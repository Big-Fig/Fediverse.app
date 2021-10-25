import 'package:fedi_app/app/account/account_bloc.dart';
import 'package:fedi_app/app/account/my/my_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MyAccountBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const MyAccountBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IMyAccountBloc, IAccountBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
