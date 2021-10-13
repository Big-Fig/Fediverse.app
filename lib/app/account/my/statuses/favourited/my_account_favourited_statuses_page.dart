import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/account/my/statuses/favourited/my_account_favourited_statuses_cached_list_bloc.dart';
import 'package:fedi/app/account/my/statuses/favourited/my_account_favourited_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_loading_widget.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/pagination/cached/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/status/pagination/cached/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class MyAccountFavouritedStatusesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageTitleAppBar(
          title: S.of(context).app_account_my_statuses_favourited_title,
        ),
        body: const SafeArea(
          child: CollapsibleOwnerWidget(
            child: StatusCachedPaginationListTimelineWidget(
              customEmptyWidget: _MyAccountFavouritedStatusesPageEmptyWidget(),
              needWatchLocalRepositoryForUpdates: true,
            ),
          ),
        ),
      );

  const MyAccountFavouritedStatusesPage();
}

class _MyAccountFavouritedStatusesPageEmptyWidget extends StatelessWidget {
  const _MyAccountFavouritedStatusesPageEmptyWidget();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return FediEmptyWidget(
      title: s.app_account_my_statuses_favourited_empty_title,
      subTitle: s.app_account_my_statuses_favourited_empty_subtitle,
    );
  }
}

void goToMyAccountFavouritedStatusesPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountFavouritedStatusesPage(),
  );
}

MaterialPageRoute<void> createMyAccountFavouritedStatusesPage() =>
    MaterialPageRoute<void>(
      builder: (context) =>
          DisposableProvider<IMyAccountFavouritedStatusesCachedListBloc>(
        create: (context) => MyAccountFavouritedStatusesCachedListBloc(
          unifediApiMyAccountService: Provider.of<IUnifediApiMyAccountService>(
            context,
            listen: false,
          ),
          statusRepository: IStatusRepository.of(
            context,
            listen: false,
          ),
        ),
        child: ProxyProvider<IMyAccountFavouritedStatusesCachedListBloc,
            IStatusCachedListBloc>(
          update: (context, value, previous) => value,
          child: StatusCachedListBlocProxyProvider(
            child: ProxyProvider<IMyAccountFavouritedStatusesCachedListBloc,
                ICachedListBloc<IStatus?>>(
              update: (context, value, previous) => value,
              child: StatusCachedListBlocLoadingWidget(
                child: StatusCachedPaginationBloc.provideToContext(
                  context,
                  child: StatusCachedPaginationListWithNewItemsBloc
                      .provideToContext(
                    context,
                    child: const MyAccountFavouritedStatusesPage(),
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
