import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_cached_list_bloc.dart';
import 'package:fedi_app/app/account/my/statuses/bookmarked/my_account_bookmarked_statuses_cached_list_bloc_impl.dart';
import 'package:fedi_app/app/list/cached/unifedi_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc_loading_widget.dart';
import 'package:fedi_app/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi_app/app/status/pagination/cached/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi_app/app/status/pagination/cached/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi_app/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi_app/app/status/repository/status_repository.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi_app/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi_app/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MyAccountBookmarkedStatusesPage extends StatelessWidget {
  const MyAccountBookmarkedStatusesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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

MaterialPageRoute<void> createMyAccountBookmarkedStatusesPage() =>
    MaterialPageRoute<void>(
      builder: (context) =>
          DisposableProvider<IMyAccountBookmarkedStatusesCachedListBloc>(
        create: (context) => MyAccountBookmarkedStatusesCachedListBloc(
          unifediApiMyAccountService: Provider.of<IUnifediApiMyAccountService>(
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
                ICachedListBloc<IStatus>>(
              update: (context, value, previous) => value,
              child: StatusCachedListBlocLoadingWidget(
                child: StatusCachedPaginationBloc.provideToContext(
                  context,
                  child: StatusCachedPaginationListWithNewItemsBloc
                      .provideToContext(
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
