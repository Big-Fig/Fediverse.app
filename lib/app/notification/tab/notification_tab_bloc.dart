import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';

abstract class INotificationTabBloc extends IDisposable {
  ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<INotification>,
      INotification> paginationListWithNewItemsBloc;
}
