import 'package:fedi/app/account/account_bloc.dart';
import 'package:fedi/app/account/details/account_details_body_widget.dart';
import 'package:fedi/app/account/statuses/account_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/list/status_list_tap_to_load_overlay_widget.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/cached/cached_pagination_model.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
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
    return DisposableProvider<IStatusCachedListBloc>(
      create: (context) => AccountStatusesCachedListBloc.createFromContext(
          context,
          account: accountBloc.account),
      child:
          DisposableProvider<IPaginationBloc<CachedPaginationPage<IStatus>, IStatus>>(
        create: (context) =>
            StatusCachedPaginationBloc.createFromContext(context),
        child: DisposableProvider<
            ICachedPaginationListWithNewItemsBloc<CachedPaginationPage
            <IStatus>, IStatus>>(
          create: (context) =>
              StatusPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>>(
                  paginationBloc: Provider.of<
                          IPaginationBloc<CachedPaginationPage<IStatus>, IStatus>>(
                      context,
                      listen: false),
                  mergeNewItemsImmediately: false,
                  statusCachedListBloc:
                      IStatusCachedListBloc.of(context, listen: false)),
          child: ProxyProvider<
              ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>, IStatus>,
              IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
            update: (context, value, previous) => value,
            child: ProxyProvider<
                ICachedPaginationListWithNewItemsBloc<CachedPaginationPage<IStatus>,
                    IStatus>,
                ICachedPaginationListWithNewItemsBloc>(
              update: (context, value, previous) => value,
              child: child,
            ),
          ),
        ),
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
              create: (context) => ScrollControllerBloc(scrollController: scrollController),
              child: AccountDetailsBodyWidget(scrollController: scrollController)),
          StatusListTapToLoadOverlayWidget(),
        ],
      );
}
