import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_widget.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';

abstract class StatusPaginationListBaseWidget
    extends PaginationListWidget<IStatus> {
  StatusPaginationListBaseWidget({
    @required Key key,
    Widget header,
    Widget footer,
    bool alwaysShowHeader,
    bool alwaysShowFooter,
    RefreshAction additionalRefreshAction,
  }) : super(
            key: key,
            footer: footer,
            header: header,
            alwaysShowHeader: alwaysShowHeader,
            alwaysShowFooter: alwaysShowFooter,
            additionalRefreshAction: additionalRefreshAction);

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      retrievePaginationListBloc(BuildContext context,
          {@required bool listen}) {
    IStatusPaginationListBloc timelinePaginationListBloc =
        IStatusPaginationListBloc.of(context, listen: listen);
    return timelinePaginationListBloc;
  }
}
