
import 'package:fedi/app/search/hashtags/search_hashtags_pagination_list_widget.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:flutter/widgets.dart';

class SearchHashtagsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CollapsibleOwnerWidget(
          child: SearchHashtagsPaginationListWidget(
        key: PageStorageKey("SearchHashtagsPaginationListWidget"),
      ));
}
