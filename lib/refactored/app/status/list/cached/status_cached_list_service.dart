import 'package:fedi/refactored/app/list/cached/cached_list_service.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusCachedListBloc extends DisposableOwner
    implements IPleromaCachedListService<IStatus> {
  static IStatusCachedListBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IStatusCachedListBloc>(context, listen: listen);

  IPleromaApi get pleromaApi;

  Future<List<IStatus>> loadLocalItems(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan});

  Future<bool> refreshItemsFromRemoteForPage(
      {@required int limit,
      @required IStatus newerThan,
      @required IStatus olderThan});

  Future preRefreshAllAction();
}
