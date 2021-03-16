import 'package:fedi/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_cached_list_bloc.dart';
import 'package:fedi/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_loading_widget.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountBookmarkedStatusesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_account_my_statuses_bookmarked_title,
      ),
      body: const SafeArea(
        child: CollapsibleOwnerWidget(
          child: StatusCachedPaginationListTimelineWidget(
            needWatchLocalRepositoryForUpdates: true,
            customEmptyWidget: _MyAccountBookmarkedStatusesPageEmptyWidget(),
          ),
        ),
      ),
    );
  }

  const MyAccountBookmarkedStatusesPage();
}

class _MyAccountBookmarkedStatusesPageEmptyWidget extends StatelessWidget {
  const _MyAccountBookmarkedStatusesPageEmptyWidget();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return FediEmptyWidget(
      title: s.app_account_my_statuses_bookmarked_empty_title,
      subTitle: s.app_account_my_statuses_bookmarked_empty_subtitle,
    );
  }
}

void goToMyAccountBookmarkedStatusesPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountBookmarkedStatusesPage(),
  );
}

MaterialPageRoute createMyAccountBookmarkedStatusesPage() {
  return MaterialPageRoute(
    builder: (context) =>
        DisposableProvider<IMyAccountBookmarkedStatusesCachedListBloc>(
      create: (context) => MyAccountBookmarkedStatusesCachedListBloc(
        pleromaMyAccountService: IPleromaMyAccountService.of(
          context,
          listen: false,
        ),
        statusRepository: IStatusRepository.of(
          context,
          listen: false,
        ),
      ),
      child: ProxyProvider<IMyAccountBookmarkedStatusesCachedListBloc,
          IStatusCachedListBloc>(
        update: (context, value, previous) => value,
        child: StatusCachedListBlocProxyProvider(
          child: ProxyProvider<IMyAccountBookmarkedStatusesCachedListBloc,
              IPleromaCachedListBloc<IStatus?>>(
            update: (context, value, previous) => value,
            child: StatusCachedListBlocLoadingWidget(
              child: StatusCachedPaginationBloc.provideToContext(
                context,
                child: StatusCachedPaginationListWithNewItemsBloc.provideToContext(
                  context,
                  child: const MyAccountBookmarkedStatusesPage(),
                  mergeNewItemsImmediately: false,
                  mergeOwnStatusesImmediately: false,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
