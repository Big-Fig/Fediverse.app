import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc_impl.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

var _logger = Logger("status_pagination_list_bloc_impl.dart");

class StatusPaginationListBloc
    extends PaginationListBloc<PaginationPage<IStatus>, IStatus>
    implements IStatusPaginationListBloc {
  StatusPaginationListBloc(
      {@required
          IPaginationBloc<PaginationPage<IStatus>, IStatus> paginationBloc})
      : super(paginationBloc: paginationBloc);

  static StatusPaginationListBloc createFromContext(BuildContext context) =>
      StatusPaginationListBloc(
          paginationBloc:
              Provider.of<IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
                  context));
}
