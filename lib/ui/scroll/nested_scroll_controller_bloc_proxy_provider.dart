import 'package:fedi/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NestedScrollControllerBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const NestedScrollControllerBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<INestedScrollControllerBloc, IScrollControllerBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
