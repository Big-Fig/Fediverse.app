import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationTabBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static INotificationTabBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<INotificationTabBloc>(context, listen: listen);

  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<INotification>,
      INotification> get paginationListWithNewItemsBloc;
}
