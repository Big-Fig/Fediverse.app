import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SearchStatusPaginationListTimelineWidget
    extends StatusCachedPaginationListTimelineWidget {
  const SearchStatusPaginationListTimelineWidget({
    Key? key,
    Widget? header,
    bool forceFirstItemPadding = false,
    Widget? footer,
    bool? alwaysShowHeader,
    bool? alwaysShowFooter,
    required bool needWatchLocalRepositoryForUpdates,
  }) : super(
            key: key,
            header: header,
            footer: footer,
            needWatchLocalRepositoryForUpdates:
                needWatchLocalRepositoryForUpdates,
            forceFirstItemPadding: forceFirstItemPadding,
            alwaysShowFooter: alwaysShowFooter,
            alwaysShowHeader: alwaysShowHeader);

  @override
  IPaginationListBloc<PaginationPage<IStatus>, IStatus>
      retrievePaginationListBloc(
    BuildContext context, {
    required bool listen,
  }) {
    var timelinePaginationListBloc =
        Provider.of<IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
            context,
            listen: listen);
    return timelinePaginationListBloc;
  }
}
