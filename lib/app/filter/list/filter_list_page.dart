import 'package:fedi/app/filter/list/cached/filter_cached_list_bloc_impl.dart';
import 'package:fedi/app/filter/list/filter_list_create_button_widget.dart';
import 'package:fedi/app/filter/pagination/cached/filter_cached_pagination_bloc_impl.dart';
import 'package:fedi/app/filter/pagination/list/filter_cached_pagination_list_bloc_impl.dart';
import 'package:fedi/app/filter/pagination/list/filter_pagination_list_widget.dart';
import 'package:fedi/app/ui/empty/fedi_empty_widget.dart';
import 'package:fedi/app/ui/page/app_bar/fedi_page_title_app_bar.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FediPageTitleAppBar(
        title: S.of(context).app_filter_list_title,
      ),
      body: const SafeArea(
        child: FilterPaginationListWidget(
          customEmptyWidget: _FilterListPagePageEmptyWidget(),
        ),
      ),
    );
  }

  const FilterListPage();
}

class _FilterListPagePageEmptyWidget extends StatelessWidget {
  const _FilterListPagePageEmptyWidget();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FediEmptyWidget(
          title: s.app_filter_list_empty,
        ),
        const FilterListCreateButtonWidget(),
      ],
    );
  }
}

void goToFilterListPage(
  BuildContext context,
) {
  Navigator.push(
    context,
    createFilterListPageRoute(
      context: context,
    ),
  );
}

MaterialPageRoute createFilterListPageRoute({
  @required BuildContext context,
}) {
  return MaterialPageRoute(
    builder: (context) => FilterCachedListBloc.provideToContext(
      context,
      child: FilterCachedPaginationBloc.provideToContext(
        context,
        child: FilterCachedPaginationListBloc.provideToContext(
          context,
          child: const FilterListPage(),
        ),
      ),
    ),
  );
}
