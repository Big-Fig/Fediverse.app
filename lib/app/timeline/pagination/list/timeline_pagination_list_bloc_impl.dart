import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_bloc.dart';
import 'package:fedi/app/timeline/pagination/timeline_pagination_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/widgets.dart';

class TimelinePaginationListBloc
    extends PaginationListBloc<CachedNetworkPaginationPage<IStatus>, IStatus>
    implements ITimelinePaginationListBloc {
  TimelinePaginationListBloc(
      {@required ITimelinePaginationBloc timelinePaginationBloc})
      : super(paginationBloc: timelinePaginationBloc);
}
