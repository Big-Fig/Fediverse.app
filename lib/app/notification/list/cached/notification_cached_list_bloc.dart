import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationCachedListBloc extends DisposableOwner
    implements IPleromaCachedListBloc<INotification> {
  static INotificationCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<INotificationCachedListBloc>(context, listen: listen);

  @override
  IPleromaApi get pleromaApi;

  @override
  Future<List<INotification>> loadLocalItems(
      {@required int limit,
      @required INotification newerThan,
      @required INotification olderThan});

  @override
  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required INotification newerThan,
      @required INotification olderThan});

  Stream<List<INotification>> watchLocalItemsNewerThanItem(INotification item);
}
