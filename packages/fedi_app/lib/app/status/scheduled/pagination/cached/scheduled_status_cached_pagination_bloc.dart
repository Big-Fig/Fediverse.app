import 'package:fedi_app/app/pagination/cached/cached_unifedi_pagination_bloc.dart';
import 'package:fedi_app/app/status/scheduled/scheduled_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusCachedPaginationBloc
    implements ICachedUnifediPaginationBloc<IScheduledStatus> {
  static IScheduledStatusCachedPaginationBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IScheduledStatusCachedPaginationBloc>(
        context,
        listen: listen,
      );
}
