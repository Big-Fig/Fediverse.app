import 'package:fedi/app/instance/details/instance_details_bloc.dart';
import 'package:fedi/app/instance/instance_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceDetailsBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const InstanceDetailsBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IInstanceDetailsBloc, IInstanceBloc>(
        update: (context, bloc, previous) => bloc,
        child: child,
      );
}
