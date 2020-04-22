import 'package:fedi/refactored/app/list/cached/cached_list_service.dart';
import 'package:fedi/refactored/app/notification/notification_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationCachedListService extends DisposableOwner
    implements IPleromaCachedListService<INotification> {
  static INotificationCachedListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<INotificationCachedListService>(context, listen: listen);

  IPleromaApi get pleromaApi;

  Future<List<INotification>> loadLocalItems(
      {@required int limit,
      @required INotification newerThan,
      @required INotification olderThan});

  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required INotification newerThan,
      @required INotification olderThan});
}
