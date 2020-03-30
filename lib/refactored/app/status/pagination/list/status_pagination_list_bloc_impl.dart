import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/status_pagination_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/app/timeline/local_preferences/timeline_local_preferences_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/pagination/network/cached_network_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

var _logger = Logger("status_pagination_list_bloc_impl.dart");

class StatusPaginationListBloc
    extends PaginationListBloc<CachedNetworkPaginationPage<IStatus>, IStatus>
    implements IStatusPaginationListBloc {

  StatusPaginationListBloc(
      {@required IStatusPaginationBloc paginationBloc})
      : super(paginationBloc: paginationBloc);
}
