import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/my/statuses/favourited/my_account_favourited_statuses_cached_list_bloc.dart';
import 'package:fedi/app/account/my/statuses/favourited/my_account_favourited_statuses_cached_list_bloc_impl.dart';
import 'package:fedi/app/list/cached/pleroma_cached_list_bloc.dart';
import 'package:fedi/app/status/list/cached/status_cached_list_bloc.dart';
import 'package:fedi/app/status/pagination/cached/status_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_timeline_widget.dart';
import 'package:fedi/app/status/pagination/list/status_cached_pagination_list_with_new_items_bloc_impl.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_title_app_bar.dart';
import 'package:fedi/collapsible/collapsible_owner_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAccountFavouritedStatusesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediSubPageTitleAppBar(
        title: "app.account.my.statuses.favourited.title".tr(),
      ),
      body: SafeArea(
        child: CollapsibleOwnerWidget(
          child: StatusCachedPaginationListTimelineWidget(
            needWatchLocalRepositoryForUpdates: true,
          ),
        ),
      ),
    );
  }
}

void goToMyAccountFavouritedStatusesPage(BuildContext context) {
  Navigator.push(
    context,
    createMyAccountFavouritedStatusesPage(),
  );
}

MaterialPageRoute createMyAccountFavouritedStatusesPage() {
  return MaterialPageRoute(
    builder: (context) =>
        DisposableProvider<IMyAccountFavouritedStatusesCachedListBloc>(
      create: (context) => MyAccountFavouritedStatusesCachedListBloc(
        pleromaMyAccountService: IPleromaMyAccountService.of(
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
        child: ProxyProvider<IMyAccountFavouritedStatusesCachedListBloc,
            IPleromaCachedListBloc<IStatus>>(
          update: (context, value, previous) => value,
          child: StatusCachedPaginationBloc.provideToContext(
            context,
            child: StatusCachedPaginationListWithNewItemsBloc.provideToContext(
              context,
              child: MyAccountFavouritedStatusesPage(),
              mergeNewItemsImmediately: false,
            ),
          ),
        ),
      ),
    ),
  );
}
