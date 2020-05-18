import 'package:fedi/refactored/app/account/account_bloc.dart';
import 'package:fedi/refactored/app/account/account_widget.dart';
import 'package:fedi/refactored/app/account/statuses/account_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/refactored/app/account/statuses/account_statuses_widget.dart';
import 'package:fedi/refactored/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc.dart';
import 'package:fedi/refactored/collapsible/collapsible_bloc_impl.dart';
import 'package:fedi/refactored/collapsible/toggle_collapsible_overlay_widget.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_header_widget.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var accountBloc = IAccountBloc.of(context, listen: true);

    return DisposableProvider<IStatusCachedListBloc>(
      create: (context) => AccountStatusesCachedListBloc.createFromContext(
          context,
          account: accountBloc.account),
      child:
          DisposableProvider<IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
        create: (context) =>
            StatusCachedPaginationBloc.createFromContext(context),
        child: DisposableProvider<
            IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>>(
          create: (context) =>
              StatusPaginationListWithNewItemsBloc<PaginationPage<IStatus>>(
                  paginationBloc: Provider.of<
                          IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
                      context,
                      listen: false),
                  mergeNewItemsImmediately: false,
                  statusCachedListService:
                      IStatusCachedListBloc.of(context, listen: false)),
          child: ProxyProvider<
              IPaginationListWithNewItemsBloc<PaginationPage<IStatus>, IStatus>,
              IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
            update: (context, value, previous) => value,
            child: ProxyProvider<
                IPaginationListWithNewItemsBloc<PaginationPage<IStatus>,
                    IStatus>,
                IPaginationListWithNewItemsBloc>(
              update: (context, value, previous) => value,
              child: PaginationListWithNewItemsHeaderWidget(
                child: DisposableProvider<ICollapsibleBloc>(
                  create: (context) =>
                      CollapsibleBloc.createFromContext(context),
                  child: Stack(
                    children: <Widget>[
                      const AccountStatusesWidget(
                        header: AccountWidget(),
                        alwaysShowHeader: true,
                        key: PageStorageKey("AccountDetailsWidget"),
                      ),
                      const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ToggleCollapsibleOverlayWidget(),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  const AccountDetailsWidget();
}
