import 'package:fedi_app/app/access/join/join_access_bloc.dart';
import 'package:fedi_app/app/server_list/server_list_auto_complete_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class JoinAccessBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const JoinAccessBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IJoinAccessBloc, IServerListAutoCompleteBloc>(
        update: (context, value, previous) => value.serverListAutoCompleteBloc,
        child: child,
      );
}
