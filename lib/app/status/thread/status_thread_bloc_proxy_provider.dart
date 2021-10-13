import 'package:fedi/app/status/list/status_list_bloc.dart';
import 'package:fedi/app/status/thread/status_thread_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusThreadBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const StatusThreadBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IStatusThreadBloc, IStatusListBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
