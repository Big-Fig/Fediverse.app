import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/server_list/server_list_auto_complete_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class JoinUnifediApiAccessBlocProxyProvider extends StatelessWidget {
  final Widget child;

  JoinUnifediApiAccessBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IJoinUnifediApiAccessBloc,
        IServerListAutoCompleteBloc>(
      update: (context, value, previous) => value.serverListAutoCompleteBloc,
      child: child,
    );
  }
}
