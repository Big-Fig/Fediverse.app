import 'package:fedi/app/account/account_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_widget.dart';
import 'package:fedi/collapsible/collapsible_bloc.dart';
import 'package:fedi/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountDetailsBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DisposableProvider<ICollapsibleBloc>(
        create: (context) => CollapsibleBloc.createFromContext(context),
        child: Stack(
          children: <Widget>[
            buildAccountStatusesWidget(context),
            const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ToggleCollapsibleOverlayWidget(),
                ))
          ],
        ),
      );

  AccountStatusesWidget buildAccountStatusesWidget(BuildContext context) =>
      AccountStatusesWidget(
        header: AccountWidget(
          onStatusesTapCallback: () {
            var scrollControllerBloc =
                IScrollControllerBloc.of(context, listen: false);
            scrollControllerBloc.scrollController.animateTo(
              MediaQuery.of(context).size.height / 2,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOut,
            );
          },
        ),
        alwaysShowHeader: true,
        key: PageStorageKey("AccountDetailsWidget"),
      );

  const AccountDetailsBodyWidget();
}
