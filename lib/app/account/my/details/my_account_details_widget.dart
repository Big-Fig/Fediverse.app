import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/my/details/my_account_details_body_widget.dart';
import 'package:fedi/app/account/statuses/with_replies/account_statuses_with_replies_cached_list_bloc_impl.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_loading_widget.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountDetailsWidget extends StatefulWidget {
  const MyAccountDetailsWidget();

  @override
  _MyAccountDetailsWidgetState createState() => _MyAccountDetailsWidgetState();
}

class _MyAccountDetailsWidgetState extends State<MyAccountDetailsWidget> {
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
  Widget build(BuildContext context) => Provider.value(
        value: scrollControllerBloc,
        child: buildAccountDetailsProviders(
          context,
          buildListWithNewItemsOverlayContainer(context),
        ),
      );

  static Widget buildAccountDetailsProviders(
      BuildContext context, Widget child) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return AccountStatusesWithRepliesCachedListBloc.provideToContext(
      context,
      account: accountBloc.account,
      child: StatusCachedListBlocLoadingWidget(
        child: StatusCachedPaginationBloc.provideToContext(
          context,
          child: StatusCachedPaginationListWithNewItemsBloc.provideToContext(
            context,
            mergeNewItemsImmediately: true,
            child: child,
            mergeOwnStatusesImmediately: false,
          ),
        ),
      ),
    );
  }

  Widget buildListWithNewItemsOverlayContainer(BuildContext context) => Stack(
        children: [
          MyAccountDetailsBodyWidget(scrollController: scrollController),
          const StatusListTapToLoadOverlayWidget()
        ],
      );
}
