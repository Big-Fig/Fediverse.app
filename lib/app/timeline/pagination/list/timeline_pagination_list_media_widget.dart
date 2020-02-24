import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/app/status/list_item/status_list_item_media_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/status/status_model_adapter.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TimelinePaginationMediaListWidget
    extends TimelinePaginationListBaseWidget {
  ScrollView buildChildCollectionView(
      BuildContext context, List<IStatus> statuses) {
    // filter only items with attachments
    var filteredStatuses = statuses
        .where((status) => status.mediaAttachments?.isNotEmpty == true)
        .toList();

    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: filteredStatuses.length,
      itemBuilder: (BuildContext context, int index) {
        var status = filteredStatuses[index];
        return new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StatusDetail(
                  status: mapLocalStatusToRemoteStatus(status),
                ),
              ),
            );
          },
          child: StatusListItemMediaWidget(status: status),
        );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}
