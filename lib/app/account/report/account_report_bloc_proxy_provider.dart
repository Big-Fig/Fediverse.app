import 'package:fedi/app/account/report/account_report_bloc.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountReportBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const AccountReportBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IAccountReportBloc, IStatusListBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
