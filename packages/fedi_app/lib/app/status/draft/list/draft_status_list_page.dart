import 'package:fedi_app/app/status/draft/list/local_only/draft_status_local_only_list_bloc_impl.dart';
import 'package:fedi_app/app/status/draft/pagination/list/draft_status_pagination_list_bloc_impl.dart';
import 'package:fedi_app/app/status/draft/pagination/list/draft_status_pagination_list_widget.dart';
import 'package:fedi_app/app/status/draft/pagination/local_only/draft_status_local_only_pagination_bloc_impl.dart';
import 'package:fedi_app/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraftStatusListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_statuses_draft_title,
        ),
        body: const SafeArea(
          child: DraftStatusPaginationListTimelineWidget(
            customEmptyWidget: _DraftStatusListPageEmptyWidget(),
            key: PageStorageKey('DraftStatusPaginationListTimelineWidget'),
            needWatchLocalRepositoryForUpdates: true,
          ),
        ),
      );

  const DraftStatusListPage({Key? key}) : super(key: key);
}

class _DraftStatusListPageEmptyWidget extends StatelessWidget {
  const _DraftStatusListPageEmptyWidget();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return FediEmptyWidget(
      title: s.app_account_my_statuses_draft_empty_title,
      subTitle: s.app_account_my_statuses_draft_subtitle,
    );
  }
}

void goToDraftStatusListPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => DraftStatusLocalOnlyListBloc.provideToContext(
        context,
        child: DraftStatusLocalOnlyPaginationBloc.provideToContext(
          context,
          maximumCachedPagesCount: null,
          child: DraftStatusPaginationListBloc.provideToContext(
            context,
            child: const DraftStatusListPage(
              key: PageStorageKey('DraftStatusListPage'),
            ),
          ),
        ),
      ),
    ),
  );
}
