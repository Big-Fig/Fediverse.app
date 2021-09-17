import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/notification/notification_model.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class INotificationCachedListBloc
    implements
        ICachedListBloc<INotification>,
        DisposableOwner,
        IAsyncInitLoadingBloc {
  static INotificationCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<INotificationCachedListBloc>(context, listen: listen);

  @override
  IUnifediApiService get unifediApi;

  @override
  Future<List<INotification>> loadLocalItems({
    required int? limit,
    required INotification? newerThan,
    required INotification? olderThan,
  });

  @override
  Future refreshItemsFromRemoteForPage({
    required int? limit,
    required INotification? newerThan,
    required INotification? olderThan,
  });

  Stream<List<INotification>> watchLocalItemsNewerThanItem(INotification? item);

  Future dismissAll();
}
