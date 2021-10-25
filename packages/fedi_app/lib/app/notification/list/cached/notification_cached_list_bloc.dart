import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:fedi_app/app/notification/notification_model.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

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
  Future<void> refreshItemsFromRemoteForPage({
    required int? limit,
    required INotification? newerThan,
    required INotification? olderThan,
  });

  Stream<List<INotification>> watchLocalItemsNewerThanItem(INotification? item);

  Future<void> dismissAll();
}
