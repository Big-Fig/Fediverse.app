import 'package:fedi/app/pagination/cached/cached_pleroma_pagination_bloc.dart';
import 'package:fedi/app/status/scheduled/scheduled_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusCachedPaginationBloc
    implements ICachedPleromaPaginationBloc<IScheduledStatus> {
  static IScheduledStatusCachedPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IScheduledStatusCachedPaginationBloc>(context,
          listen: listen);
}
