import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/refactored/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc_impl.dart';
import 'package:fedi/refactored/app/status/scheduled/list/cached/scheduled_status_cached_list_service.dart';
import 'package:fedi/refactored/app/status/scheduled/pagination/cached/scheduled_status_cached_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/scheduled/pagination/list/scheduled_status_pagination_list_widget.dart';
import 'package:fedi/refactored/app/status/scheduled/pagination/list/scheduled_status_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/refactored/app/status/scheduled/scheduled_status_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/refactored/pagination/list/with_new_items/pagination_list_with_new_items_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduledStatusListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).tr("app.status.scheduled"
            ".title")),
      ),
      body: SafeArea(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return DisposableProvider<IScheduledStatusCachedListService>(
      create: (context) =>
          ScheduledStatusCachedListService.createFromContext(context),
      child: DisposableProvider<
          IPaginationBloc<PaginationPage<IScheduledStatus>, IScheduledStatus>>(
        create: (BuildContext context) => ScheduledStatusCachedPaginationBloc(
            itemsCountPerPage: 20,
            maximumCachedPagesCount: null,
            scheduledStatusListService:
                IScheduledStatusCachedListService.of(context, listen: false)),
        child: DisposableProvider<
            IPaginationListWithNewItemsBloc<PaginationPage<IScheduledStatus>,
                IScheduledStatus>>(
          create: (context) => ScheduledStatusPaginationListWithNewItemsBloc(
              scheduledStatusCachedListService:
                  IScheduledStatusCachedListService.of(context, listen: false),
              mergeNewItemsImmediately: false,
              paginationBloc: Provider.of<
                  IPaginationBloc<PaginationPage<IScheduledStatus>,
                      IScheduledStatus>>(context, listen: false)),
          child: ProxyProvider<
              IPaginationListWithNewItemsBloc<PaginationPage<IScheduledStatus>,
                  IScheduledStatus>,
              IPaginationListBloc<PaginationPage<IScheduledStatus>,
                  IScheduledStatus>>(
            update: (context, value, previous) => value,
            child: ProxyProvider<
                IPaginationListWithNewItemsBloc<
                    PaginationPage<IScheduledStatus>, IScheduledStatus>,
                IPaginationListWithNewItemsBloc>(
              update: (context, value, previous) => value,
              child: ScheduledStatusPaginationListTimelineWidget(
                key: PageStorageKey(
                    "ScheduledStatusPaginationListTimelineWidget"),
                needWatchLocalRepositoryForUpdates: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void goToScheduledStatusListPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScheduledStatusListPage()),
  );
}
