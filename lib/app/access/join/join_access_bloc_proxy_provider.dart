import 'package:fedi/app/access/join/join_access_bloc.dart';
import 'package:fedi/app/server_list/server_list_auto_complete_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class JoinUnifediApiAccessBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const JoinUnifediApiAccessBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IJoinUnifediApiAccessBloc, IServerListAutoCompleteBloc>(
        update: (context, value, previous) => value.serverListAutoCompleteBloc,
        child: child,
      );
}
