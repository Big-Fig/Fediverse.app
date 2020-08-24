import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/search/accounts/search_accounts_list_widget.dart';
import 'package:fedi/app/search/accounts/search_accounts_pagination_list_bloc.dart';
import 'package:fedi/app/search/hashtags/search_hashtags_list_widget.dart';
import 'package:fedi/app/search/hashtags/search_hashtags_pagination_list_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_widget.dart';
import 'package:fedi/app/search/result/pagination/search_account_pagination_bloc_impl.dart';
import 'package:fedi/app/search/result/pagination/search_hashtag_pagination_bloc_impl.dart';
import 'package:fedi/app/search/result/pagination/search_status_pagination_bloc_impl.dart';
import 'package:fedi/app/search/result/search_result_item_list_widget.dart';
import 'package:fedi/app/search/search_bloc.dart';
import 'package:fedi/app/search/search_model.dart';
import 'package:fedi/app/search/statuses/search_statuses_list_widget.dart';
import 'package:fedi/app/search/statuses/search_statuses_pagination_list_bloc.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<SearchTab> tabs = [
  SearchTab.all,
  SearchTab.accounts,
  SearchTab.statuses,
  SearchTab.hashtags,
];

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchBloc = ISearchBloc.of(context, listen: false);

    return StreamBuilder<bool>(
        stream: searchBloc.searchInputBloc.confirmedSearchTermIsNotEmptyStream,
        initialData: searchBloc.searchInputBloc.confirmedSearchTermIsNotEmpty,
        builder: (context, snapshot) {
          var confirmedSearchTermIsNotEmpty = snapshot.data;
          if (confirmedSearchTermIsNotEmpty) {
            return buildNonEmptyInputBody(searchBloc, context);
          } else {
            return RecentSearchWidget();
          }
        });
  }

  DefaultTabController buildNonEmptyInputBody(
      ISearchBloc searchBloc, BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: tabs.indexOf(searchBloc.selectedTab),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTabBar(context, tabs, searchBloc),
          FediUltraLightGreyDivider(),
          Expanded(child: buildTabsWidget(context, tabs, searchBloc))
        ],
      ),
    );
  }

  Widget buildTabBar(
          BuildContext context, List<SearchTab> tabs, ISearchBloc searchBloc) =>
      Padding(
        padding: FediPadding.allBigPadding,
        child: Builder(
          builder: (context) => FediTextTabIndicatorWidget(
            isTransparent: false,
            tabs: tabs,
            tabController: DefaultTabController.of(context),
            tabToTextMapper: mapTabToTitle,
          ),
        ),
      );

  String mapTabToTitle(BuildContext context, SearchTab tab) {
    switch (tab) {
      case SearchTab.accounts:
        return tr("app.search.tab.accounts");
        break;
      case SearchTab.statuses:
        return tr("app.search.tab.statuses");
        break;
      case SearchTab.all:
        return tr("app.search.tab.all");
        break;
      case SearchTab.hashtags:
        return tr("app.search.tab.hashtags");
        break;
    }

    throw "Invalid tab $tab";
  }

  Widget buildTabsWidget(
          BuildContext context, List<SearchTab> tabs, ISearchBloc searchBloc) =>
      TabBarView(
          children: List<Widget>.generate(
        tabs.length,
        (int index) {
          var tab = tabs[index];

          return UnfocusOnScrollAreaWidget(
              child: buildTabBody(context, tab, searchBloc));
        },
      ));

  Widget buildTabBody(
      BuildContext context, SearchTab tab, ISearchBloc searchBloc) {
    switch (tab) {
      case SearchTab.accounts:
        return buildAccountsTab(context);
        break;
      case SearchTab.statuses:
        return buildStatusesTab(context);

        break;
      case SearchTab.all:
        return buildAllTab(context);

        break;
      case SearchTab.hashtags:
        return buildHashtagsTab(context);
        break;
    }
    throw "Invalid tab $tab";
  }

  Widget buildAllTab(BuildContext context) => SearchResultItemListWidget();

  Widget buildStatusesTab(BuildContext context) {
    return SearchStatusPaginationBloc.provideToContext(
      context,
      child: DisposableProvider<
          IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
        create: (context) =>
            SearchStatusesPaginationListBloc.createFromContext(context),
        child: SearchStatusesListWidget(),
      ),
    );
  }

  Widget buildHashtagsTab(BuildContext context) {
    return SearchHashtagPaginationBloc.provideToContext(
      context,
      child: DisposableProvider<
          IPaginationListBloc<PaginationPage<IHashtag>, IHashtag>>(
        create: (context) =>
            SearchHashtagsPaginationListBloc.createFromContext(context),
        child: SearchHashtagsListWidget(),
      ),
    );
  }

  Widget buildAccountsTab(BuildContext context) {
    return SearchAccountPaginationBloc.provideToContext(
      context,
      child: DisposableProvider<IAccountPaginationListBloc>(
        create: (context) =>
            SearchAccountsPaginationListBloc.createFromContext(context),
        child: ProxyProvider<IAccountPaginationListBloc,
                IPaginationListBloc<PaginationPage<IAccount>, IAccount>>(
            update: (context, value, previous) => value,
            child: SearchAccountsListWidget()),
      ),
    );
  }
}
