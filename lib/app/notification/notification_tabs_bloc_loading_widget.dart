import 'package:fedi/app/notification/notification_tabs_bloc.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:flutter/cupertino.dart';

class NotificationTabsBlocLoadingWidget extends StatelessWidget {
  final Widget child;

  NotificationTabsBlocLoadingWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: INotificationTabsBloc.of(context),
        loadingFinishedBuilder: (_) => child,
      );
}
