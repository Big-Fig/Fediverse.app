import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi/app/account/pagination/network_only/account_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/list/network_only/network_only_list_service.dart';
import 'package:fedi/app/search/accounts/search_accounts_list_service.dart';
import 'package:fedi/app/search/accounts/search_accounts_list_widget.dart';
import 'package:fedi/app/search/accounts/search_accounts_pagination_list_bloc.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/search/search_bloc.dart';
import 'package:fedi/app/search/search_model.dart';
import 'package:fedi/app/search/statuses/search_statuses_list_service.dart';
import 'package:fedi/app/search/statuses/search_statuses_list_widget.dart';
import 'package:fedi/app/search/statuses/search_statuses_pagination_list_bloc.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/tab/fedi_text_tab_indicator_item_widget.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:fedi/ui/scroll/unfocus_on_scroll_area_widget.dart';
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchInputWidget(),
          ),
          Expanded(
            child: DefaultTabController(
              length: tabs.length,
              initialIndex: tabs.indexOf(searchBloc.selectedTab),
              child: Column(
                children: <Widget>[
                  StreamBuilder<String>(
                      stream:
                          searchBloc.searchInputBloc.confirmedSearchTermStream,
                      initialData:
                          searchBloc.searchInputBloc.confirmedSearchTerm,
                      builder: (context, snapshot) {
                        var searchText = snapshot.data;
                        var text =
                            "app.search.desc.value".tr(args: [searchText]);
                        if (searchText?.isNotEmpty == true) {
                        } else {
                          text = "app.search.desc.empty".tr();
                        }
                        return Text(
                          text,
                        );
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildTabBar(context, tabs, searchBloc),
                  ),
                  FediUltraLightGreyDivider(),
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
      Builder(
        builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: tabs
                .map((tab) => FediTextTabIndicatorItemWidget(
                      label: mapTabToTitle(context, tab),
                      index: tabs.indexOf(tab),
                      isTransparent: false,
                      tabController: DefaultTabController.of(context),
                    ))
                .toList()),
      );

  String mapTabToTitle(BuildContext context, SearchTab tab) {
    switch (tab) {
      case SearchTab.accounts:
        return tr("app.search.tab.accounts");
        break;
      case SearchTab.statuses:
        return tr("app.search.tab.statuses");
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
        return DisposableProvider<IPleromaNetworkOnlyListService<IAccount>>(
          create: (context) =>
              SearchAccountsListService.createFromContext(context),
          child: DisposableProvider<
              IPaginationBloc<PaginationPage<IAccount>, IAccount>>(
            create: (context) =>
                AccountNetworkOnlyPaginationBloc.createFromContext(context),
            child: DisposableProvider<IAccountPaginationListBloc>(
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
            child: DisposableProvider<
                IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
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
