import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/details/account_details_body_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDetailsWidget extends StatefulWidget {
  @override
  _AccountDetailsWidgetState createState() => _AccountDetailsWidgetState();

  static Widget buildAccountDetailsProviders(
      BuildContext context, Widget child) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return AccountStatusesCachedListBloc.provideToContext(
      context,
      account: accountBloc.account,
      child: StatusCachedPaginationBloc.provideToContext(
        context,
        child: StatusCachedPaginationListWithNewItemsBloc.provideToContext(
            context,
            mergeNewItemsImmediately: true,
            child: child),
      ),
    );
  }
}

class _AccountDetailsWidgetState extends State<AccountDetailsWidget> {
  ScrollControllerBloc scrollControllerBloc;
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollControllerBloc =
        ScrollControllerBloc(scrollController: scrollController);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    scrollControllerBloc.dispose();
  }

  @override
  Widget build(BuildContext context) => Provider<IScrollControllerBloc>.value(
        value: scrollControllerBloc,
        child: AccountDetailsWidget.buildAccountDetailsProviders(
            context, buildListWithNewItemsOverlayContainer(context)),
      );

  Widget buildListWithNewItemsOverlayContainer(BuildContext context) => Stack(
        children: [
          DisposableProvider<IScrollControllerBloc>(
              create: (context) =>
                  ScrollControllerBloc(scrollController: scrollController),
              child:
                  AccountDetailsBodyWidget(scrollController: scrollController)),
          StatusListTapToLoadOverlayWidget(),
        ],
      );
}
