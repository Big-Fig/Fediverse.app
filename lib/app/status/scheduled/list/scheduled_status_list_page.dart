import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/scheduled/list/cached/scheduled_status_cached_list_bloc_impl.dart';
import 'package:fedi/app/status/scheduled/pagination/cached/scheduled_status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/scheduled/pagination/list/scheduled_status_pagination_list_widget.dart';
import 'package:fedi/app/status/scheduled/pagination/list/scheduled_status_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduledStatusListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.status.scheduled.title"),
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
          child: ScheduledStatusPaginationListTimelineWidget(
            key: PageStorageKey("ScheduledStatusPaginationListTimelineWidget"),
            needWatchLocalRepositoryForUpdates: true,
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
