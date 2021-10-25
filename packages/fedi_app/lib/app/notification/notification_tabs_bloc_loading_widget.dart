import 'package:fedi_app/app/notification/notification_tabs_bloc.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:flutter/cupertino.dart';

class NotificationTabsBlocLoadingWidget extends StatelessWidget {
  final Widget child;

  const NotificationTabsBlocLoadingWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: INotificationTabsBloc.of(context),
        loadingFinishedBuilder: (_) => child,
      );
}
