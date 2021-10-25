import 'package:fedi_app/app/search/result/search_result_item_pagination_list_widget.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_widget.dart';
import 'package:flutter/widgets.dart';

class SearchResultItemListWidget extends StatelessWidget {
  const SearchResultItemListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const CollapsibleOwnerWidget(
        child: SearchResultItemPaginationListWidget(
          key: PageStorageKey('SearchResultItemListWidget'),
        ),
      );
}
