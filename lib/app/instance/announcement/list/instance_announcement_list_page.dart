import 'package:fedi/app/instance/announcement/list/cached/instance_announcement_cached_list_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/pagination/cached/instance_announcement_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/pagination/list/instance_announcement_cached_pagination_list_bloc_impl.dart';
import 'package:fedi/app/instance/announcement/pagination/list/instance_announcement_pagination_list_widget.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstanceAnnouncementListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_instance_announcement_list_title,
      ),
      body: const SafeArea(
        child: InstanceAnnouncementPaginationListWidget(
          customEmptyWidget: _InstanceAnnouncementListPagePageEmptyWidget(),
          alwaysShowFooter: false,
        ),
      ),
    );
  }

  const InstanceAnnouncementListPage();
}

class _InstanceAnnouncementListPagePageEmptyWidget extends StatelessWidget {
  const _InstanceAnnouncementListPagePageEmptyWidget();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FediEmptyWidget(
          title: s.app_instance_announcement_list_empty,
        ),
      ],
    );
  }
}

void goToInstanceAnnouncementListPage(
  BuildContext context,
) {
  Navigator.push(
    context,
    createInstanceAnnouncementListPageRoute(
      context: context,
    ),
  );
}

MaterialPageRoute createInstanceAnnouncementListPageRoute({
  required BuildContext context,
}) {
  return MaterialPageRoute(
    builder: (context) => InstanceAnnouncementCachedListBloc.provideToContext(
      context,
      child: InstanceAnnouncementCachedPaginationBloc.provideToContext(
        context,
        child: InstanceAnnouncementCachedPaginationListBloc.provideToContext(
          context,
          child: const InstanceAnnouncementListPage(),
        ),
      ),
    ),
  );
}
