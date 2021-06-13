import 'package:fedi/app/status/draft/draft_status_model.dart';
import 'package:fedi/app/ui/pagination/fedi_pagination_list_widget.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class DraftStatusPaginationListBaseWidget
    extends FediPaginationListWidget<IDraftStatus> {
  const DraftStatusPaginationListBaseWidget({
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
        );

  @override
  IPaginationListBloc<PaginationPage<IDraftStatus>, IDraftStatus>
      retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) {
    var paginationListBloc = Provider.of<
        IPaginationListBloc<PaginationPage<IDraftStatus>, IDraftStatus>>(
      context,
      listen: listen,
    );

    return paginationListBloc;
  }
}
