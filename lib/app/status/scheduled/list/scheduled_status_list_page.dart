import 'package:fedi/generated/l10n.dart';
import 'package:fedi/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc_impl.dart';
import 'package:fedi/app/status/scheduled/pagination/cached/scheduled_status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/scheduled/pagination/list/scheduled_status_pagination_list_widget.dart';
import 'package:fedi/app/status/scheduled/pagination/list/scheduled_status_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/pagination/cached/with_new_items/cached_pagination_list_with_new_items_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduledStatusListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: S.of(context).app_status_scheduled_title,
      ),
      body: SafeArea(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return ScheduledStatusCachedListBloc.provideToContext(
      context,
      child: ScheduledStatusCachedPaginationBloc.provideToContext(
        context,
        itemsCountPerPage: 20,
        maximumCachedPagesCount: null,
        child: ScheduledStatusPaginationListWithNewItemsBloc.provideToContext(
          context,
          child: Builder(
            builder: (context) {
              var cachedPaginationListWithNewItemsBloc =
                  ICachedPaginationListWithNewItemsBloc.of(context,
                      listen: false);
              return ScheduledStatusPaginationListTimelineWidget(
                key: PageStorageKey(
                    "ScheduledStatusPaginationListTimelineWidget"),
                needWatchLocalRepositoryForUpdates: true,
                successCallback: () {
                  cachedPaginationListWithNewItemsBloc
                      .refreshWithController();
                },
              );
            },
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
