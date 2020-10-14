import 'package:fedi/app/account/statuses/account_statuses_timeline_widget.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailsBodyWidget extends StatelessWidget {
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) => CollapsibleOwnerWidget(
        child: buildAccountStatusesWidget(context),
      );

  AccountStatusesTimelineWidget buildAccountStatusesWidget(
          BuildContext context) =>
      AccountStatusesTimelineWidget(
        scrollController: scrollController, //        header: FediListTile(
//          isFirstInList: true,
//          child: AccountWidget(
//            onStatusesTapCallback: () {
//              var scrollControllerBloc =
//                  IScrollControllerBloc.of(context, listen: false);
//              scrollControllerBloc.scrollController.animateTo(
//                MediaQuery.of(context).size.height / 2,
//                duration: Duration(milliseconds: 500),
//                curve: Curves.easeOut,
//              );
//            },
//          ),
//        ),
//        alwaysShowHeader: true,
        key: PageStorageKey("AccountDetailsBodyWidget"),
      );

  const AccountDetailsBodyWidget({this.scrollController});
}
