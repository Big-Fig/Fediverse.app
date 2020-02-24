import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/list/pagination_list_widget.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class TimelinePaginationListBaseWidget
    extends PaginationListWidget<IStatus> {

  TimelinePaginationListBaseWidget({ @required Key key }) : super(key: key);

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    ITimelinePaginationListBloc timelinePaginationListBloc =
        ITimelinePaginationListBloc.of(context, listen: listen);
    return timelinePaginationListBloc;
  }
}
