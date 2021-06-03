import 'package:fedi/app/notification/list/cached/notification_cached_list_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:flutter/cupertino.dart';

class NotificationCachedListBlocLoadingWidget extends StatelessWidget {
  final Widget child;

  NotificationCachedListBlocLoadingWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: INotificationCachedListBloc.of(context),
        loadingFinishedBuilder: (_) => child,
      );
}
