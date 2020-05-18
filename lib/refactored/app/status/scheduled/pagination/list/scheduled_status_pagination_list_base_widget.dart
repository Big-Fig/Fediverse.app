import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ScheduledStatusPaginationListBaseWidget
    extends PaginationListWidget<IScheduledStatus> {
  ScheduledStatusPaginationListBaseWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
  }) : super(
            key: key,
            footer: footer,
            header: header,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter,);

  @override
  IPaginationListBloc<PaginationPage<IScheduledStatus>, IScheduledStatus>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IScheduledStatus>,
            IScheduledStatus>>(context, listen: listen);
    return paginationListBloc;
  }
}
