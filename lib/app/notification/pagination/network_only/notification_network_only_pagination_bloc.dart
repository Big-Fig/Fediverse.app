import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationNetworkOnlyPaginationBloc
    implements INetworkOnlyPleromaPaginationBloc<INotification> {
  static INotificationNetworkOnlyPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<INotificationNetworkOnlyPaginationBloc>(context,
          listen: listen);
}
