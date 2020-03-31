import 'package:fedi/refactored/app/account/account_model.dart';
import 'package:fedi/refactored/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/refactored/app/search/accounts/search_accounts_list_service.dart';
import 'package:fedi/refactored/app/search/accounts/search_accounts_list_widget.dart';
import 'package:fedi/refactored/app/search/accounts/search_accounts_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:fedi/refactored/app/search/input/search_input_widget.dart';
import 'package:fedi/refactored/app/search/search_bloc.dart';
import 'package:fedi/refactored/app/search/search_model.dart';
import 'package:fedi/refactored/app/search/statuses/search_statuses_list_service.dart';
import 'package:fedi/refactored/app/search/statuses/search_statuses_list_widget.dart';
import 'package:fedi/refactored/app/search/statuses/search_statuses_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/list/status_pagination_list_bloc.dart';
import 'package:fedi/refactored/app/status/pagination/network_only/status_network_only_pagination_bloc_impl.dart';
import 'package:fedi/refactored/app/status/status_model.dart';
import 'package:fedi/refactored/disposable/disposable_provider.dart';
import 'package:fedi/refactored/pagination/pagination_bloc.dart';
import 'package:fedi/refactored/pagination/pagination_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<SearchTab> tabs = [
  SearchTab.accounts,
  SearchTab.statuses,
];

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchBloc = ISearchBloc.of(context, listen: false);

    return Provider<ISearchInputBloc>.value(
      value: searchBloc.searchInputBloc,
      child: Column(
        children: <Widget>[
          SearchInputWidget(),
          Expanded(
            child: DefaultTabController(
              length: tabs.length,
              initialIndex: tabs.indexOf(searchBloc.selectedTab),
              child: Column(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: buildTabBar(context, tabs, searchBloc)),
                  Expanded(child: buildTabsWidget(context, tabs, searchBloc))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabBar(
          BuildContext context, List<SearchTab> tabs, ISearchBloc searchBloc) =>
      TabBar(
        tabs: tabs.map((tab) {
          return buildTab(context, tab);
        }).toList(),
        onTap: (index) {
          searchBloc.selectTab(tabs[index]);
        },
      );

  Tab buildTab(BuildContext context, SearchTab tab) =>
      Tab(text: mapTabToTitle(context, tab));

  String mapTabToTitle(BuildContext context, SearchTab tab) {
//    var appLocalizations = AppLocalizations.of(context);

    // todo: localization
    switch (tab) {
      case SearchTab.accounts:
        return "Accounts";
        break;
      case SearchTab.statuses:
        return "Statuses";

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

          return buildTabBody(context, tab, searchBloc);
        },
      ));

  Widget buildTabBody(
      BuildContext context, SearchTab tab, ISearchBloc searchBloc) {
    // todo: localization
    switch (tab) {
      case SearchTab.accounts:
        return DisposableProvider<IPleromaNetworkOnlyListService<IAccount>>(
          create: (context) =>
              SearchAccountsListService.createFromContext(context),
          child: DisposableProvider<
              IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
            create: (context) =>
                AccountNetworkOnlyPaginationBloc.createFromContext(context),
            child: Provider<IAccountPaginationListBloc>(
              create: (context) =>
                  SearchAccountsPaginationListBloc.createFromContext(context),
              child: SearchAccountsListWidget(),
            ),
          ),
        );
        break;
      case SearchTab.statuses:
        return DisposableProvider<IPleromaNetworkOnlyListService<IStatus>>(
          create: (context) =>
              SearchStatusesListService.createFromContext(context),
          child: DisposableProvider<
              IPaginationBloc<PaginationPage<IStatus>, IStatus>>(
            create: (context) =>
                StatusNetworkOnlyPaginationBloc.createFromContext(context),
            child: DisposableProvider<IStatusPaginationListBloc>(
              create: (context) =>
                  SearchStatusesPaginationListBloc.createFromContext(context),
              child: SearchStatusesListWidget(),
            ),
          ),
        );

        break;
    }
    throw "Invalid tab $tab";
  }
}
