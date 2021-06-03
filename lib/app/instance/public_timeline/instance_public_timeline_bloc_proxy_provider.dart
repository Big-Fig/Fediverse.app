import 'package:fedi/app/instance/public_timeline/instance_public_timeline_bloc.dart';
import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstancePublicTimelineBlocProxyProvider extends StatelessWidget {
  final Widget child;

  InstancePublicTimelineBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IInstancePublicTimelineBloc, IInstanceBloc>(
        update: (context, bloc, previous) => bloc,
        child: child,
      );
}
