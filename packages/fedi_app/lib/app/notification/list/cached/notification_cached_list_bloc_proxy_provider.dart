import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:fedi_app/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi_app/app/notification/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NotificationCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const NotificationCachedListBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          INotificationCachedListBloc, ICachedListBloc<INotification>>(
        update: (context, value, previous) => value,
        child: child,
      );
}
