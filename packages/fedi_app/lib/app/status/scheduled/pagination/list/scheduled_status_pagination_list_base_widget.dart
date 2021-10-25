import 'package:fedi_app/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi_app/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ScheduledStatusPaginationListBaseWidget
    extends FediPaginationListWidget<IScheduledStatus> {
  const ScheduledStatusPaginationListBaseWidget({
    required Key key,
    Widget? header,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    Widget? customEmptyWidget,
    Widget? customLoadingWidget,
    bool refreshOnFirstLoad = true,
  }) : super(
          key: key,
          footer: footer,
          header: header,
          alwaysShowHeader: alwaysShowHeader,
          alwaysShowFooter: alwaysShowFooter,
          customEmptyWidget: customEmptyWidget,
          customLoadingWidget: customLoadingWidget,
          refreshOnFirstLoad: refreshOnFirstLoad,
          isNeedToAddPaddingForUiTests: false,
        );

  @override
  IPaginationListBloc<PaginationPage<IScheduledStatus>, IScheduledStatus>
      retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IScheduledStatus>,
            IScheduledStatus>>(context, listen: listen);

    return paginationListBloc;
  }
}
