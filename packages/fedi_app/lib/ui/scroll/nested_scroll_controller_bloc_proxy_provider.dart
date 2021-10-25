import 'package:fedi_app/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi_app/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NestedScrollControllerBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const NestedScrollControllerBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<INestedScrollControllerBloc, IScrollControllerBloc>(
        update: (context, value, previous) => value,
        child: child,
      );
}
