import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class NotificationCachedListBlocProxyProvider extends StatelessWidget {
  final Widget child;

  const NotificationCachedListBlocProxyProvider({required this.child});

  @override
  Widget build(BuildContext context) => ProxyProvider<
          INotificationCachedListBloc, ICachedListBloc<INotification>>(
        update: (context, value, previous) => value,
        child: child,
      );
}
