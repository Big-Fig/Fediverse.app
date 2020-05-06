import 'package:fedi/refactored/app/list/cached/cached_list_service.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusCachedListService extends DisposableOwner
    implements IPleromaCachedListService<IScheduledStatus> {
  static IScheduledStatusCachedListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IScheduledStatusCachedListService>(context, listen: listen);

  Stream<List<IScheduledStatus>> watchLocalItemsNewerThanItem(IScheduledStatus item);
}
