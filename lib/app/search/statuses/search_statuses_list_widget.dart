import 'package:fedi/app/search/statuses/search_status_pagination_list_timeline_widget.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:flutter/widgets.dart';

class SearchStatusesListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const CollapsibleOwnerWidget(
        child: SearchStatusPaginationListTimelineWidget(
          key: PageStorageKey('SearchStatusesListWidget'),
          needWatchLocalRepositoryForUpdates: false,
        ),
      );
  const SearchStatusesListWidget();
}
