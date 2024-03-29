import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/account/pagination/list/account_pagination_list_bloc.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/search/accounts/search_accounts_list_widget.dart';
import 'package:fedi_app/app/search/accounts/search_accounts_pagination_list_bloc.dart';
import 'package:fedi_app/app/search/hashtags/search_hashtags_list_widget.dart';
import 'package:fedi_app/app/search/hashtags/search_hashtags_pagination_list_bloc.dart';
import 'package:fedi_app/app/search/recent/recent_search_widget.dart';
import 'package:fedi_app/app/search/result/pagination/search_account_pagination_bloc_impl.dart';
import 'package:fedi_app/app/search/result/pagination/search_hashtag_pagination_bloc_impl.dart';
import 'package:fedi_app/app/search/result/pagination/search_status_pagination_bloc_impl.dart';
import 'package:fedi_app/app/search/result/search_result_item_list_widget.dart';
import 'package:fedi_app/app/search/search_bloc.dart';
import 'package:fedi_app/app/search/search_model.dart';
import 'package:fedi_app/app/search/statuses/search_statuses_list_widget.dart';
import 'package:fedi_app/app/search/statuses/search_statuses_pagination_list_bloc.dart';
import 'package:fedi_app/app/status/status_model.dart';
import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/fedi_padding.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_bloc.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_bloc_impl.dart';
import 'package:fedi_app/app/ui/tab/indicator/fedi_tab_indicator_model.dart';
import 'package:fedi_app/app/ui/tab/indicator/text/fedi_text_tab_indicator_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fedi_app/pagination/list/pagination_list_bloc.dart';
import 'package:fedi_app/pagination/pagination_model.dart';
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
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchBloc = ISearchBloc.of(context);

    return StreamBuilder<bool>(
      stream: searchBloc.searchInputBloc.confirmedSearchTermIsNotEmptyStream,
      initialData: searchBloc.searchInputBloc.confirmedSearchTermIsNotEmpty,
      builder: (context, snapshot) {
        var confirmedSearchTermIsNotEmpty = snapshot.data!;
        if (confirmedSearchTermIsNotEmpty) {
          return const _SearchWidgetNonEmptyBody();
        } else {
          return const RecentSearchWidget();
        }
      },
    );
  }
}

class _SearchWidgetNonEmptyBody extends StatelessWidget {
  const _SearchWidgetNonEmptyBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchBloc = ISearchBloc.of(context);

    return DefaultTabController(
      length: tabs.length,
      initialIndex: tabs.indexOf(searchBloc.selectedTab),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          _SearchTabBarWidget(),
          FediUltraLightGreyDivider(),
          Expanded(
            child: _SearchBodyWidget(),
          ),
        ],
      ),
    );
  }
}

class _SearchBodyWidget extends StatelessWidget {
  const _SearchBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TabBarView(
        children: List<Widget>.generate(
          tabs.length,
          (int index) {
            var tab = tabs[index];

            return _SearchTabBodyWidget(tab: tab);
          },
        ),
      );
}

class _SearchTabBodyWidget extends StatelessWidget {
  const _SearchTabBodyWidget({
    Key? key,
    required this.tab,
  }) : super(key: key);

  final SearchTab tab;

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case SearchTab.accounts:
        return const _SearchWidgetAccountsTab();
      case SearchTab.statuses:
        return const _SearchWidgetStatusesTab();
      case SearchTab.all:
        return const SearchResultItemListWidget();

      case SearchTab.hashtags:
        return const _SearchWidgetHashtagsTab();
    }
  }
}

class _SearchTabBarWidget extends StatelessWidget {
  const _SearchTabBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: FediPadding.allBigPadding,
        child: Builder(
          builder: (context) {
            var tabController = DefaultTabController.of(context);

            return DisposableProvider<IFediTabIndicatorBloc<SearchTab>>(
              create: (context) => FediTabIndicatorBloc<SearchTab>(
                items: tabs,
                tabController: tabController!,
              ),
              child: const FediTextTabIndicatorWidget(
                style: FediTabStyle.bubble,
                isTransparent: false,
                tabToTextMapper: _mapTabToTitle,
              ),
            );
          },
        ),
      );
}

class _SearchWidgetAccountsTab extends StatelessWidget {
  const _SearchWidgetAccountsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SearchAccountPaginationBloc.provideToContext(
        context,
        child: DisposableProvider<IAccountPaginationListBloc>(
          create: SearchAccountsPaginationListBloc.createFromContext,
          child: ProxyProvider<IAccountPaginationListBloc,
              IPaginationListBloc<PaginationPage<IAccount>, IAccount>>(
            update: (context, value, previous) => value,
            child: const SearchAccountsListWidget(),
          ),
        ),
      );
}

class _SearchWidgetHashtagsTab extends StatelessWidget {
  const _SearchWidgetHashtagsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SearchHashtagPaginationBloc.provideToContext(
        context,
        child: DisposableProvider<
            IPaginationListBloc<PaginationPage<IHashtag>, IHashtag>>(
          create: SearchHashtagsPaginationListBloc.createFromContext,
          child: const SearchHashtagsListWidget(),
        ),
      );
}

class _SearchWidgetStatusesTab extends StatelessWidget {
  const _SearchWidgetStatusesTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      SearchStatusPaginationBloc.provideToContext(
        context,
        child: DisposableProvider<
            IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
          create: SearchStatusesPaginationListBloc.createFromContext,
          child: const SearchStatusesListWidget(),
        ),
      );
}

String _mapTabToTitle(BuildContext context, SearchTab? tab) {
  switch (tab!) {
    case SearchTab.accounts:
      return S.of(context).app_search_tab_accounts;

    case SearchTab.statuses:
      return S.of(context).app_search_tab_statuses;

    case SearchTab.all:
      return S.of(context).app_search_tab_all;

    case SearchTab.hashtags:
      return S.of(context).app_search_tab_hashtags;
  }
}
