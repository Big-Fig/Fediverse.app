import 'package:fedi/app/status/pagination/list/status_pagination_list_timeline_widget.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:flutter/widgets.dart';

class SearchStatusesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CollapsibleOwnerWidget(
          child: StatusPaginationListTimelineWidget(
        key: PageStorageKey("SearchStatusesListWidget"),
        needWatchLocalRepositoryForUpdates: false,
      ));
}
