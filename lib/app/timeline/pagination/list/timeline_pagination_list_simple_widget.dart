import 'package:fedi/Pages/Profile/OtherAccount.dart';
import 'package:fedi/Pages/Timeline/StatusDetail.dart';
import 'package:fedi/Pleroma/account/pleroma_account_model.dart';
import 'package:fedi/Pleroma/status/pleroma_status_model.dart';
import 'package:fedi/app/status/list_item/status_list_item_simple_widget.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/timeline/pagination/list/timeline_pagination_list_base_widget.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

var _logger = Logger("timeline_pagination_list_simple_widget.dart");

class TimelinePaginationSimpleListWidget
    extends TimelinePaginationListBaseWidget {
  ScrollView buildChildCollectionView(List<IStatus> statuses) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
      itemBuilder: (context, index) {
        var status = statuses[index];
        _logger.finest(() => "build $index");
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

  viewAccount(BuildContext context, IPleromaAccount account) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtherAccount(account)),
    );
  }

  viewStatusDetail(BuildContext context, IPleromaStatus status) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StatusDetail(
          status: status,
        ),
        settings: RouteSettings(name: "/StatusDetail"),
      ),
    );
  }
}
