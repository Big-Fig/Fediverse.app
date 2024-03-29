import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/status_list_bloc.dart';
import 'package:fedi_app/app/status/scheduled/scheduled_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusCachedListBloc extends DisposableOwner
    implements ICachedListBloc<IScheduledStatus>, IStatusListBloc {
  static IScheduledStatusCachedListBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IScheduledStatusCachedListBloc>(context, listen: listen);

  Stream<List<IScheduledStatus>> watchLocalItemsNewerThanItem(
    IScheduledStatus? item,
  );
}
