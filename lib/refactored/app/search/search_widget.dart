import 'package:fedi/refactored/app/search/input/search_input_bloc.dart';
import 'package:fedi/refactored/app/search/input/search_input_widget.dart';
import 'package:fedi/refactored/app/search/search_bloc.dart';
import 'package:fedi/refactored/app/search/tab/accounts/search_accounts_tab_bloc.dart';
import 'package:fedi/refactored/app/search/tab/accounts/search_accounts_tab_bloc_impl.dart';
import 'package:fedi/refactored/app/search/tab/accounts/search_accounts_tab_widget.dart';
import 'package:fedi/refactored/app/search/search_tab_model.dart';
import 'package:fedi/refactored/app/search/tab/statuses/search_statuses_tab_bloc.dart';
import 'package:fedi/refactored/app/search/tab/statuses/search_statuses_tab_bloc_impl.dart';
import 'package:fedi/refactored/app/search/tab/statuses/search_statuses_tab_widget.dart';
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
    
    return Column(
      children: <Widget>[
        Provider<ISearchInputBloc>.value(
            value: searchBloc.searchInputBloc, child: SearchInputWidget()),
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
      BuildContext context, List<SearchTab> tabs, ISearchBloc searchBloc) => TabBarView(
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
        return Provider<ISearchAccountsTabBloc>(
          create: (_) => SearchAccountsTabBloc(),
          child: SearchAccountsTabWidget(),
        );
        break;
      case SearchTab.statuses:
        return Provider<ISearchStatusesTabBloc>(
          create: (_) => SearchStatusesTabBloc(),
          child: SearchStatusesTabWidget(),
        );

        break;
    }
    throw "Invalid tab $tab";
  }
}
