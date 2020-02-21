import 'package:fedi/app/status/list_item/status_list_item_simple_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimelinePaginationSimpleListWidget extends TimelinePaginationListBase {
  Widget buildChildCollectionView(List<IStatus> statuses) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
      itemBuilder: (context, index) {
        var status = statuses[index];
        return StatusListItemSimpleWidget(
          initialStatusData: status,
          viewAccount: (account) {
            viewAccount(context, account);
          },
          viewStatusContext: (account) {
            viewStatusDetail(context, account);
          },
        );
      },
      itemCount: statuses.length,
    );
  }
}
