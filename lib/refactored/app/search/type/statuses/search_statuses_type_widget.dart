import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_timeline_widget.dart';
import 'package:flutter/widgets.dart';

class SearchStatusesTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusPaginationListTimelineWidget(
      key: PageStorageKey("SearchStatusesTabWidget"),
    );
  }
}
