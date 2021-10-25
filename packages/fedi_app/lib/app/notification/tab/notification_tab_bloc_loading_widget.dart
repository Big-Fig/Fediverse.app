import 'package:fedi_app/app/notification/tab/notification_tab_bloc.dart';
import 'package:fedi_app/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:flutter/cupertino.dart';

class NotificationTabBlocLoadingWidget extends StatelessWidget {
  final Widget child;

  const NotificationTabBlocLoadingWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediAsyncInitLoadingWidget(
        asyncInitLoadingBloc: INotificationTabBloc.of(context),
        loadingFinishedBuilder: (_) => child,
      );
}
