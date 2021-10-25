import 'package:fedi_app/app/home/tab/home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/home_tab_bloc_proxy_provider.dart';
import 'package:fedi_app/app/home/tab/timelines/timelines_home_tab_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TimelinesHomeTabBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const TimelinesHomeTabBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<ITimelinesHomeTabBloc, IHomeTabBloc>(
        update: (context, value, previous) => value,
        child: HomeTabBlocProxyProvider(child: child),
      );
}
