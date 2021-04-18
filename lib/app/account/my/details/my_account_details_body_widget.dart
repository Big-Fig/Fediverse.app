import 'package:fedi/app/account/my/my_account_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_timeline_widget.dart';
import 'package:fedi/app/ui/list/fedi_list_tile.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountDetailsBodyWidget extends StatelessWidget {
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) => CollapsibleOwnerWidget(
        child: buildAccountStatusesWidget(context),
      );

  AccountStatusesTimelineWidget buildAccountStatusesWidget(
    BuildContext context,
  ) =>
      AccountStatusesTimelineWidget(
        scrollController: scrollController,
        header: const FediListTile(
          isFirstInList: true,
          child: MyAccountWidget(
            onStatusesTapCallback: _onStatusesTapCallback,
            footer: null,
            brightness: Brightness.dark,
          ),
        ),
        alwaysShowHeader: true,
        key: PageStorageKey("MyAccountDetailsBodyWidget"),
      );

  const MyAccountDetailsBodyWidget({this.scrollController});
}

void _onStatusesTapCallback(BuildContext context) {
  var scrollControllerBloc = IScrollControllerBloc.of(context, listen: false);
  scrollControllerBloc.scrollController!.animateTo(
    // ignore: no-magic-number
    MediaQuery.of(context).size.height / 2,
    // todo: refactor
    // ignore: no-magic-number
    duration: Duration(milliseconds: 500),
    curve: Curves.easeOut,
  );
}
