import 'package:fedi/refactored/app/list/cached/cached_list_service.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusCachedListService extends DisposableOwner
    implements IPleromaCachedListService<IStatus> {
  static IStatusCachedListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IStatusCachedListService>(context, listen: listen);

  Future preRefreshAllAction();

  Stream<List<IStatus>> watchLocalItemsNewerThanItem(IStatus item);
}
