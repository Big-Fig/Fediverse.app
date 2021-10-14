import 'package:fedi/app/instance/activity/instance_activity_bloc.dart';
import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceActivityBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const InstanceActivityBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IInstanceActivityBloc, IInstanceBloc>(
        update: (context, bloc, previous) => bloc,
        child: child,
      );
}
