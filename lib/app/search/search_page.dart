import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/search/recent/local_preferences/recent_search_local_preference_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_bloc_impl.dart';
import 'package:fedi/app/search/result/list/search_result_item_network_only_list_bloc_impl.dart';
import 'package:fedi/app/search/result/pagination/search_result_item_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/search/result/pagination/search_result_item_pagination_list_bloc.dart';
import 'package:fedi/app/search/search_bloc.dart';
import 'package:fedi/app/search/search_bloc_impl.dart';
import 'package:fedi/app/search/search_model.dart';
import 'package:fedi/app/search/search_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediPageCustomAppBar(
          leading: const FediBackIconButton(),
          child: const SearchInputWidget(
            autofocus: true,
          ),
        ),
        body: const SearchWidget(),
      );

  const SearchPage();
}

void goToSearchPage(
  BuildContext context, {
  SearchTab startTab = SearchTab.all,
  String? initialQuery,
}) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (context) => DisposableProvider<ISearchBloc>(
        create: (context) => SearchBloc.createFromContext(
          context,
          startTab: startTab,
          initialQuery: initialQuery,
        ),
        child: ProxyProvider<ISearchBloc, ISearchInputBloc>(
          update: (
            BuildContext context,
            ISearchBloc value,
            ISearchInputBloc? previous,
          ) =>
              value.searchInputBloc,
          child: DisposableProvider<IRecentSearchBloc>(
            create: (context) => RecentSearchBloc(
              searchInputBloc: ISearchInputBloc.of(context, listen: false),
              recentSearchLocalPreferenceBloc:
                  IRecentSearchLocalPreferenceBloc.of(context, listen: false),
            ),
            child: SearchResultItemNetworkOnlyListBloc.provideToContext(
              context,
              child: SearchResultItemNetworkOnlyPaginationBloc.provideToContext(
                context,
                child: SearchResultItemPaginationListBloc.provideToContext(
                  context,
                  child: const SearchPage(),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
