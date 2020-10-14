import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/status/draft/list/local_only/draft_status_local_only_list_bloc_impl.dart';
import 'package:fedi/app/status/draft/pagination/list/draft_status_pagination_list_bloc_impl.dart';
import 'package:fedi/app/status/draft/pagination/list/draft_status_pagination_list_widget.dart';
import 'package:fedi/app/status/draft/pagination/local_only/draft_status_local_only_pagination_bloc_impl.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraftStatusListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: tr("app.status.draft.title"),
      ),
      body: SafeArea(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return DraftStatusLocalOnlyListBloc.provideToContext(
      context,
      child: DraftStatusLocalOnlyPaginationBloc.provideToContext(
        context,
        itemsCountPerPage: 20,
        maximumCachedPagesCount: null,
        child: DraftStatusPaginationListBloc.provideToContext(
          context,
          child: DraftStatusPaginationListTimelineWidget(
            key: PageStorageKey("DraftStatusPaginationListTimelineWidget"),
            needWatchLocalRepositoryForUpdates: true,
          ),
        ),
      ),
    );
  }
}

void goToDraftStatusListPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DraftStatusListPage()),
  );
}
