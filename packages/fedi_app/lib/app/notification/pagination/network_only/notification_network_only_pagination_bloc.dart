import 'package:fedi_app/app/notification/notification_model.dart';
import 'package:fedi_app/app/pagination/network_only/network_only_unifedi_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationNetworkOnlyPaginationBloc
    implements INetworkOnlyUnifediPaginationBloc<INotification> {
  static INotificationNetworkOnlyPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<INotificationNetworkOnlyPaginationBloc>(
        context,
        listen: listen,
      );
}
