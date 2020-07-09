import 'package:fedi/app/search/statuses/search_status_pagination_list_timeline_widget.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:flutter/widgets.dart';

class SearchStatusesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CollapsibleOwnerWidget(
          child: SearchStatusPaginationListTimelineWidget(
        key: PageStorageKey("SearchStatusesListWidget"),
        needWatchLocalRepositoryForUpdates: false,
      ));
}
