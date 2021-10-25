import 'package:fedi_app/app/search/statuses/search_status_pagination_list_timeline_widget.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_widget.dart';
import 'package:flutter/widgets.dart';

class SearchStatusesListWidget extends StatelessWidget {
  const SearchStatusesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CollapsibleOwnerWidget(
        child: SearchStatusPaginationListTimelineWidget(
          key: PageStorageKey('SearchStatusesListWidget'),
          needWatchLocalRepositoryForUpdates: false,
        ),
      );
}
