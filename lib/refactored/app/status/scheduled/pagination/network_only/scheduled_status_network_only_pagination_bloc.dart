import 'package:fedi/refactored/app/pagination/network_only/network_only_pleroma_pagination_bloc.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IScheduledStatusNetworkOnlyPaginationBloc
    implements INetworkOnlyPleromaPaginationBloc<IScheduledStatus> {
  static IScheduledStatusNetworkOnlyPaginationBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IScheduledStatusNetworkOnlyPaginationBloc>(context, listen: listen);
}
