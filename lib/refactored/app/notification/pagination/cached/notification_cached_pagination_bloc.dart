import 'package:fedi/refactored/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationCachedPaginationBloc
    implements ICachedPleromaPaginationBloc<INotification> {
  static INotificationCachedPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<INotificationCachedPaginationBloc>(context, listen: listen);
}
