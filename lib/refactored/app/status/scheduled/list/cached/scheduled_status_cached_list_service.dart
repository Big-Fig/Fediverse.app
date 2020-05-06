import 'package:fedi/refactored/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusCachedListService extends DisposableOwner
    implements IPleromaCachedListBloc<IScheduledStatus> {
  static IScheduledStatusCachedListService of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IScheduledStatusCachedListService>(context, listen: listen);

  Stream<List<IScheduledStatus>> watchLocalItemsNewerThanItem(IScheduledStatus item);
}
