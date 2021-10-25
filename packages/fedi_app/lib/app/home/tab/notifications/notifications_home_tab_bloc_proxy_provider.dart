import 'package:fedi_app/app/home/tab/home_tab_bloc.dart';
import 'package:fedi_app/app/home/tab/home_tab_bloc_proxy_provider.dart';
import 'package:fedi_app/app/home/tab/notifications/notifications_home_tab_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NotificationsHomeTabBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const NotificationsHomeTabBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<INotificationsHomeTabBloc, IHomeTabBloc>(
        update: (context, value, previous) => value,
        child: HomeTabBlocProxyProvider(child: child),
      );
}
