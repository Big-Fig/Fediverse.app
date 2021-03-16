import 'package:fedi/app/account/statuses/account_statuses_timeline_widget.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailsBodyWidget extends StatelessWidget {
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) => CollapsibleOwnerWidget(
        child: AccountStatusesTimelineWidget(
          scrollController: scrollController, //        header: FediListTile(
          key: PageStorageKey("AccountDetailsBodyWidget"),
        ),
      );

  const AccountDetailsBodyWidget({this.scrollController});
}
