import 'package:fedi/app/search/hashtags/search_hashtags_pagination_list_widget.dart';
import 'package:flutter/widgets.dart';

class SearchHashtagsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const SearchHashtagsPaginationListWidget(
        key: PageStorageKey('SearchHashtagsListWidget'),
      );

  const SearchHashtagsListWidget();
}
