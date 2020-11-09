import 'package:fedi/app/search/result/search_result_item_pagination_list_widget.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:flutter/widgets.dart';

class SearchResultItemListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const CollapsibleOwnerWidget(
          child: SearchResultItemPaginationListWidget(
        key: PageStorageKey("SearchResultItemListWidget"),
      ));
  const SearchResultItemListWidget();
}
