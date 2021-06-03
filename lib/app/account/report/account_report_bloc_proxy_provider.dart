import 'package:fedi/app/account/report/account_report_bloc.dart';
import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AccountReportBlocProxyProvider extends StatelessWidget {
  final Widget child;

  AccountReportBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IAccountReportBloc, IStatusListBloc>(
      update: (context, value, previous) => value,
      child: child,
    );
  }
}
