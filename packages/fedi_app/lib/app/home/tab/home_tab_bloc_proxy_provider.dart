import 'package:fedi_app/app/home/tab/home_tab_bloc.dart';
import 'package:fedi_app/app/ui/scroll/fedi_nested_scroll_view_bloc.dart';
import 'package:fedi_app/ui/scroll/nested_scroll_controller_bloc.dart';
import 'package:fedi_app/ui/scroll/nested_scroll_controller_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeTabBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const HomeTabBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IHomeTabBloc, INestedScrollControllerBloc>(
        update: (context, value, previous) => value.nestedScrollControllerBloc,
        child: ProxyProvider<IHomeTabBloc, IFediNestedScrollViewBloc>(
          update: (context, value, previous) => value.fediNestedScrollViewBloc,
          child: NestedScrollControllerBlocProxyProvider(child: child),
        ),
      );
}
