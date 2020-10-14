import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/app/search/input/search_input_widget.dart';
import 'package:fedi/app/search/recent/recent_search_bloc.dart';
import 'package:fedi/app/search/recent/recent_search_bloc_impl.dart';
import 'package:fedi/app/search/recent/recent_search_local_preference_bloc.dart';
import 'package:fedi/app/search/result/list/search_result_item_network_only_list_bloc_impl.dart';
import 'package:fedi/app/search/result/pagination/search_result_item_network_only_pagination_bloc_impl.dart';
import 'package:fedi/app/search/result/pagination/search_result_item_pagination_list_bloc.dart';
import 'package:fedi/app/search/search_bloc.dart';
import 'package:fedi/app/search/search_bloc_impl.dart';
import 'package:fedi/app/search/search_model.dart';
import 'package:fedi/app/search/search_widget.dart';
import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/page/fedi_sub_page_custom_app_bar.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: FediSubPageCustomAppBar(
          leading: FediBackIconButton(),
          child: SearchInputWidget(
            autofocus: true,
          ),
        ),
        body: SearchWidget(),
      );
}

void goToSearchPage(
  BuildContext context, {
  SearchTab startTab = SearchTab.all,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DisposableProvider<ISearchBloc>(
        create: (context) =>
            SearchBloc.createFromContext(context, startTab: startTab),
        child: ProxyProvider<ISearchBloc, ISearchInputBloc>(
          update: (BuildContext context, ISearchBloc value,
                  ISearchInputBloc previous) =>
              value.searchInputBloc,
          child: DisposableProvider<IRecentSearchBloc>(
            create: (context) => RecentSearchBloc(
              searchInputBloc: ISearchInputBloc.of(context, listen: false),
              recentSearchLocalPreferenceBloc:
                  IRecentSearchLocalPreferenceBloc.of(context, listen: false),
            ),
            child: SearchResultItemsNetworkOnlyListBloc.provideToContext(
              context,
              child: SearchResultItemNetworkOnlyPaginationBloc.provideToContext(
                context,
                child: SearchResultItemPaginationListBloc.provideToContext(
                  context,
                  child: SearchPage(),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
