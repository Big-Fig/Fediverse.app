import 'package:fedi/app/hashtag/pagination/list/hashtag_pagination_list_widget.dart';
import 'package:flutter/cupertino.dart';

class InstanceTrendsHashtagListWidget extends StatelessWidget {
  const InstanceTrendsHashtagListWidget();

  @override
  Widget build(BuildContext context) {
    return HashtagPaginationListWidget(
        // itemPadding: FediPadding.verticalMediumPadding,
        // hashtagSelectedCallback: (context, hashtag) =>
        //     goToLocalHashtagDetailsPage(
        //   context,
        //   hashtag: hashtag,
        // ),
        // key: PageStorageKey('InstanceTrendsHashtagListWidget'),
        );
  }
}
